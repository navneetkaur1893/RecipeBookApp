//
//  LoginViewController.swift
//  RecepieBook
//
//  Created by Amandeep Singh on 9/27/20.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailId: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginButton.setCustomColor(color: UIColor.appGreen)
        LoginButton.makeCornerRounded(value: 10)
    }
    
    func showAlert(alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        /* Commenetd for temp login
        var email = ""
        do {
            email = try CommonLogic.shared.validateEmail(emailValue: emailId.text)
            print(email)
        } catch EmailError.noEmailExist {
            print("No Email Exist")
            showAlert(alertTitle: "Error", alertMessage: "Please enter your email Id")
            return
        } catch EmailError.wrongEmailFormat {
            print("Wrong Email Format")
            showAlert(alertTitle: "Error", alertMessage: "Incorrect email id")
            return
        } catch let error {
            print(error)
            return
        }
        
        var password = ""
        do {
            password = try CommonLogic.shared.validatePassword(passwordValue: self.password.text)
            print(password)
        } catch PasswordError.noPasswordExist {
            print("no Password exist")
            showAlert(alertTitle: "Error", alertMessage: "Enter your password")
            return
        } catch PasswordError.wrongPAsswordFormat {
            print("Wrong password format")
            showAlert(alertTitle: "Error", alertMessage: "Incorrect password")
            return
        } catch let error {
            print(error)
            return
        }
         */
        
        let email = "navneet@gmail.com"
        let password = "navneet@123"
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if error == nil && authResult != nil {
                //TODO: Navigate to the Recepies home screen
                self?.performSegue(withIdentifier: "SegueToTabbar", sender: nil)
            } else {
                self?.showAlert(alertTitle: "Error", alertMessage: error?.localizedDescription ?? "Signup failed")
            }
        }
        
    }
}
