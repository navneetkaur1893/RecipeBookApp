//
//  UIImageView+Extension.swift
//  RecepieBook
//
//  Created by Amandeep Singh on 9/27/20.
//

import UIKit

extension UIImageView {
    
    // CODE TO BLUR AN IMAGE
    func makeImageBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.bounds
        self.addSubview(blurView)
    }
}
