//
//  UIView+Extension.swift
//  RecepieBook
//
//  Created by Amandeep Singh on 10/1/20.
//

import UIKit

extension UIView {
    
    // Method to make a button rounded
    func makeCornerRounded(value: CGFloat) {
        self.layer.cornerRadius = value
        self.tintColor = UIColor.white
    }
    
    func setCustomColor(color: UIColor) {
        self.backgroundColor = color
    }
    
    func setBorderColor(color: UIColor) {
        self.layer.borderColor = color.cgColor
    }
    
    func setBorderWidth(value: CGFloat) {
        self.layer.borderWidth = value
        self.layer.masksToBounds = true
    }
}
