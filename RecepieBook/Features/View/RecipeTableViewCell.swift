//
//  RecipeTableViewCell.swift
//  RecepieBook
//
//  Created by Amandeep Singh on 10/1/20.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var recepieImage: UIImageView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var saveButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Set saveButton properties.
        saveButton.makeCornerRounded(value: 5)
        saveButton.setBorderColor(color: .appGreen)
        saveButton.setBorderWidth(value: 1.0)
        
        // Set bgView properties.
        bgView.makeCornerRounded(value: 10.0)
        
        // Set userImage properties.
        userImage.makeCornerRounded(value: userImage.frame.size.width/2)
        userImage.setBorderColor(color: .appGreen)
        userImage.setBorderWidth(value: 1.0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
