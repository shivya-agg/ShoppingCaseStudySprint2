//
//  Validation.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/22/22.
//

import Foundation
import UIKit
import CoreData

extension UIViewController {
    
    //login
    //email validation
    func emailValidation(emailid: String) -> Bool {
        let emailRegex = "^[A-Z0-9a-z.-]+@[A-Z0-9a-z.-]+\\.[A-Za-z]{2,64}$"
        let emailCheck = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let emailValid = emailCheck.evaluate(with: emailid)
        return emailValid
    }
    
    //password validation
    func passwordValidation(password: String) -> Bool {
        let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@%!.#$%&?])[A-Za-z\\d@$!%*#?&]{6,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordCheck.evaluate(with: password)
    }
    
    //emptyFields check
    func loginEmptyFieldCheck(email: String, password: String) -> Bool {
        if (email.isEmpty && password.isEmpty || email.isEmpty || password.isEmpty) {
            return true
        }
        return false
    }
    //sign up
    
    func signupEmptyFieldCheck(name: String, email: String, mobile: String, password: String, confirmPassword: String) -> Bool {
        
        if (name.isEmpty ||  email.isEmpty || mobile.isEmpty || password.isEmpty || confirmPassword.isEmpty){
            
            return true
        }
        return false
        
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
    
    //check email id if it exists or not
    func emailExists(emailId: String) -> Bool {
        
        let context = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<UserData>(entityName: "UserData")
        var customerArray: [NSManagedObject] = []
        do {
            customerArray = try context.fetch(fetchRequest)
            for elements in customerArray {
                if let email = elements.value(forKey: "emailId") as? String {
                    if (email == emailId.lowercased()) {
                        return true
                }
        
                }
            }
        }catch(let error) {
            print(error.localizedDescription)
        }
        return false
    }
    
    //check if email exists then password entered by user is also correct for the respective user
    
    func emailExistPasswordCheck(password: String) -> Bool {
        let context = AppDelegate.sharedAppDelegateInstance().persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<UserData>(entityName: "UserData")
        var customerArray: [NSManagedObject] = []
        do {
            customerArray = try context.fetch(fetchRequest)
            for elements in customerArray {
            
                if let pass = elements.value(forKey: "password") as? String {
                    if (pass == password) {
                        return true
                }
        
                }
            }
        }catch(let error) {
            print(error.localizedDescription)
        }
        return false    }
    
    //alert display
    func displayAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}
