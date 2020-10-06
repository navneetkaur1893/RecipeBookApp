//
//  AddDetailTableViewCell.swift
//  RecepieBook
//
//  Created by Amandeep Singh on 10/2/20.
//

import UIKit

class AddDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var uploadImageButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        uploadImageButton.makeCornerRounded(value: 10.0)
        uploadImageButton.setBorderColor(color: .systemGray2)
        uploadImageButton.setBorderWidth(value: 1.0)
        
        bgView.makeCornerRounded(value: 5.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
