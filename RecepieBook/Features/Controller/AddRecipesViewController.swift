//
//  AddRecipesViewController.swift
//  RecepieBook
//
//  Created by Amandeep Singh on 10/2/20.
//

import UIKit

class AddRecipesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var postToFeedButton: UIButton!
    var buttonTag = -1
    var recipeModel = RecipeDetailModel()
    var cellInfo: [[String: String]] = [["Gallery": "   +  Upload Images or Open Camera"], ["Ingredients": "   +  Add Ingredient"], ["How to Cook": "   +  Add Directions"], ["Additional Info": "   +  Add Info"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postToFeedButton.makeCornerRounded(value: 10.0)
        postToFeedButton.backgroundColor = .appGreen
        
        print(recipeModel)
    }
    
    @IBAction func postToFeedButtonPressed(_ sender: Any) {
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        // Save the tag of selected button
        buttonTag = sender.tag
        showActionSheet()
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
    }
    
    @IBAction func detailButtonPressed(_ sender: UIButton) {
        // Save the tag of selected button
        buttonTag = sender.tag
        switch sender.tag {
        case 10:
            showActionSheet()
        case 11:
            return
        case 12:
            return
        case 13:
            return
        default:
            return
        }
    }
    
    func showActionSheet() {
        let alert = UIAlertController(title: "Choose Image", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { _ in
            self.openGallery()
        }))
        
        alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            DispatchQueue.main.async {
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have camera", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            DispatchQueue.main.async {
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        else
        {
            let alert  = UIAlertController(title: "Warning", message: "You don't have permission to access gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension AddRecipesViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 146
        } else {
            return 134
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddRecipieTableViewCell") as? AddRecipieTableViewCell else {
                return UITableViewCell()
            }
            cell.ReceipeName.text = "Recipe Name"
            cell.newRecipe.text = "New Recipe"
            cell.addRecipeImage.tag = ("\(indexPath.section)" + "\(indexPath.row)" as NSString).integerValue
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddDetailTableViewCell") as? AddDetailTableViewCell else {
                return UITableViewCell()
            }
            let dic = cellInfo[indexPath.row]
            cell.titleLabel.text = Array(dic.keys)[0]
            cell.uploadImageButton.setTitle(Array(dic.values)[0] , for: .normal)
            cell.uploadImageButton.tag = ("\(indexPath.section)" + "\(indexPath.row)" as NSString).integerValue
            return cell
        }
    }
}

extension AddRecipesViewController {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            //addImageButton.setTitle("", for: .normal)
            //addImageButton.contentMode = .scaleAspectFill
            //addImageButton.setBackgroundImage(pickedImage, for: .normal)
            
            switch buttonTag {
            case 00:
                if recipeModel.profile == nil {
                    recipeModel.profile = RecipeProfile(recipeLogo: pickedImage.pngData(), recipeTitle: "")
                } else {
                    recipeModel.profile?.recipeLogo = pickedImage.pngData()
                }
                print(recipeModel)
            case 10:
                if recipeModel.galleryImage == nil {
                    recipeModel.galleryImage = [RecipeGalleryImage(image: pickedImage.pngData())]
                } else {
                    recipeModel.galleryImage?.append(RecipeGalleryImage(image: pickedImage.pngData()))
                }
            default:
                return
            }
        }
        DispatchQueue.main.async {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
