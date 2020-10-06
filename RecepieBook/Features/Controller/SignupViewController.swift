//
//  SignupViewController.swift
//  RecepieBook
//
//  Created by Amandeep Singh on 9/27/20.
//

import UIKit
import Firebase

enum EmailError: Error {
    case noEmailExist
    case wrongEmailFormat
}

enum PasswordError: Error {
    case noPasswordExist
    case wrongPAsswordFormat
}

class SignupViewController: UIViewController {
    
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var emailTextField: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        signUp.setCustomColor(color: UIColor.appGreen)
        signUp.makeCornerRounded(value: 10)
    }
    
    func showAlert(alertTitle: String, alertMessage: String) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signUpButton(_ sender: UIButton) {

        var email = ""
        do {
                    email = try CommonLogic.shared.validateEmail(emailValue: emailText.text)
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
            password = try CommonLogic.shared.validatePassword(passwordValue: passwordText.text)
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
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if error == nil && authResult != nil {
                self?.showAlert(alertTitle: "Success", alertMessage: "Your account has been created")
            } else {
                self?.showAlert(alertTitle: "Error", alertMessage: error?.localizedDescription ?? "Signup failed")
            }
        }
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
