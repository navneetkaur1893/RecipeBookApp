//
//  RecipesListViewController.swift
//  RecepieBook
//
//  Created by Amandeep Singh on 10/1/20.
//

import UIKit

class RecipesListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self .title = "Recipes"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 335
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RecepieCell") as? RecipeTableViewCell else {
            return UITableViewCell()
        }
        cell.userName.text = "Navneet Kaur"
        cell.userImage.image = UIImage(named: "DummyChef")
        cell.recepieImage.image = UIImage(named: "DummyRecipe")
        return cell
        // return cell ?? UITableViewCell()
    }
}
