//
//  LaunchViewController.swift
//  RecepieBook
//
//  Created by Amandeep Singh on 9/27/20.
//

import UIKit

class InitialViewController: UIViewController {
        
    @IBOutlet weak var splashImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //splashImage.makeImageBlur()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.performSegue(withIdentifier: "ShowLoginScreen", sender: nil)
        }
    }
}
