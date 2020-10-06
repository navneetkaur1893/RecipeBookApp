//
//  AddRecipieTableViewCell.swift
//  RecepieBook
//
//  Created by Amandeep Singh on 10/2/20.
//

import UIKit

class AddRecipieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addRecipeImage: UIButton!
    @IBOutlet weak var writeRecipeName: UITextField!
    @IBOutlet weak var ReceipeName: UILabel!
    @IBOutlet weak var newRecipe: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addRecipeImage.makeCornerRounded(value: 10.0)
        addRecipeImage.setBorderColor(color: .darkGray)
        addRecipeImage.setBorderWidth(value: 1.0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
