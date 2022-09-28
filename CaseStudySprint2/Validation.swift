//
//  Validation.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/22/22.
//

import Foundation
import UIKit
import CoreData
import Firebase

extension UIViewController {
    
    //login

    //login emptyFields check
    func loginEmptyFieldCheck(email: String, password: String) -> Bool {
        if (email.isEmpty || password.isEmpty) {
            return true
        }
        return false
    }
    
    //sign up empty fields check
    func signupEmptyFieldCheck(name: String, email: String, mobile: String, password: String, confirmPassword: String) -> Bool {
        
        if (name.isEmpty ||  email.isEmpty || mobile.isEmpty || password.isEmpty || confirmPassword.isEmpty){
            
            return true
        }
        return false
        
    }
    //password validation
    func passwordValidation(password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@%!.#$%&?])[A-Za-z\\d@$!%*#?&]{6,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordCheck.evaluate(with: password)
    }
    
    
    //mobile validation
    func mobileValidation(mobile: String) -> Bool {
        let mobileRegex = "^[0-9]{10}$"
        let mobilePredicate = NSPredicate(format: "SELF MATCHES %@", mobileRegex)
        let isMobileValid = mobilePredicate.evaluate(with: mobile)
        return isMobileValid
    }
    
    //name validation
    func nameValidation(username: String) -> Bool {
        let nameRegex = "^[A-Za-z]{4,}$"
        let namePredicate = NSPredicate(format: "SELF MATCHES %@", nameRegex)
        let isNameValid = namePredicate.evaluate(with: username)
        return isNameValid
    }
  
    //confirm password validation
    func confirmPasswordValidation(password: String, confirmPass: String) -> Bool {
        return password == confirmPass
    }
    
   
    //displays alert message with different title
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //this function returns error message corresponding to firebase error
    func displayErrorMessage(error: NSError) -> String {
        var errorMessage = ""
        guard let errorCode = AuthErrorCode.Code(rawValue: error.code) else {
            return "Try again"
        }
        switch errorCode {
            case .userNotFound:
                errorMessage = "User does not exist. Please sign up"
                
            case .invalidEmail:
                errorMessage = "Enter a valid email example: rodger123@gmail.com"
                
            case .weakPassword:
                errorMessage = "Password is invalid"
                
            case .wrongPassword:
                errorMessage = "Wrong password. Kindly recheck and try again"
                
            case .emailAlreadyInUse:
                errorMessage = "Email id already exists"
                
            
            default:
                errorMessage = "Oops! an error occured"
        }
        return errorMessage
    }
    
    //this function displays alert error message
    func displayAlertMessage(message: String) {
        let alertBox = UIAlertController(title: "ERROR", message: message, preferredStyle: .alert)
        alertBox.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: nil))
        self.present(alertBox, animated: true)
        }
}
