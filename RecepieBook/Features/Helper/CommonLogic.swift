//
//  CommonLogic.swift
//  RecepieBook
//
//  Created by Amandeep Singh on 9/30/20.
//

import Foundation
class CommonLogic {
    
    static let shared = CommonLogic()
    
    func validateEmail(emailValue: String?) throws -> String {
        // it checks if emailValue exist and also count
        guard let emailId = emailValue, emailId.count > 0 else {
            // Alert to enter an valid email id
            throw EmailError.noEmailExist
        }
        
        // it trimmes the whitespace and new line from a string
        let trimmedEmail = emailId.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // regex to check email format
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isValidEmail = emailPred.evaluate(with: trimmedEmail)
        
        // it returns emailID if valid otherwise it throws error
        if isValidEmail {
            return trimmedEmail
        } else {
            throw EmailError.wrongEmailFormat
        }
    }
    
    func validatePassword(passwordValue: String?)throws -> String {
        guard let passwordVa = passwordValue, passwordVa.count > 0 else {
            throw PasswordError.noPasswordExist
        }
        
        let trimmedPassword = passwordVa.trimmingCharacters(in: .whitespacesAndNewlines)
        // PW must be 8 char long && 1 Special char
        let specialPassword = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$")
        let isValidPassword = specialPassword.evaluate(with: trimmedPassword)
        
        if isValidPassword {
            return trimmedPassword
        } else {
            throw PasswordError.wrongPAsswordFormat
        }
    }
}
