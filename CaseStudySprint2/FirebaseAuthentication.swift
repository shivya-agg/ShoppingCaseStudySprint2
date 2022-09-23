//
//  FirebaseAuthentication.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/22/22.
//

import Foundation
import Firebase
import UIKit

class FirebaseAuthentication: UIViewController {
    

    //MARK: Functions
    //MARK: Registering user
    func firebaseUserRegistration(name: String, email: String, mobile: String, password: String) {
    Auth.auth().createUser(withEmail: email, password: password, completion: {(result, error) -> Void in
            if let _error = error {
                self.displayAlert(title: "Successfully Registered", message: "\(name) your basic details registration is done.")
            }
            else {
                self.displayAlert(title: "Incomplete", message: "Registration not completed. Try again later.")
            }
        })
        
       
    }
    
    func firebaseLoginValidation(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password,completion: {(result, error) -> Void in
            if let _error = error {
                print(_error.localizedDescription)
            } else {
                print("Valid user")
                //Navigating Tab bar controller - category
                let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
                self.navigationController?.pushViewController(tabBarController, animated: true)
                
            }
        })
    }
    
    
    
}



