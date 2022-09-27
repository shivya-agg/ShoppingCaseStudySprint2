//
//  ViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/20/22.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var authenticationImage: UIImageView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPasswordTextField: UITextField!

    //MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginEmailTextField.layer.cornerRadius = 10
        loginPasswordTextField.layer.cornerRadius = 10
        
        loginEmailTextField.setIcon(UIImage(named: "loginUser.png")!)
        loginPasswordTextField.setIcon(UIImage(named: "loginPassword.png")!)
        
        navigationItem.hidesBackButton = true
        
        //image properties
        authenticationImage.layer.borderWidth = 0.5
        authenticationImage.layer.cornerRadius = authenticationImage.frame.height / 2
        authenticationImage.clipsToBounds = true
        
        //login button properties
        loginButton.layer.cornerRadius = 15
        
        //signup button properties
        signupButton.layer.cornerRadius = 15
     
        let array = DBOperationsManager.dbManagerSharedInstance().fetchUserRecord()
        print(array)

        
         let deviceAuthentication = DeviceAuthentication()
         deviceAuthentication.deviceAuthenticationByPasscode()
        // deviceAuthentication.deviceAuthenticationByFaceID()
         
        
        //login authentication
    }
    
    //MARK: @IBActions
    //MARK: Unwinding segue to move to previous view controller
    @IBAction func unwindToFirstViewController(_ sender: UIStoryboardSegue){
        
    }

    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        //checking user has entered data in all fields
        if loginEmptyFieldCheck(email: loginEmailTextField.text!, password: loginPasswordTextField.text!) {
            displayAlert(title: "Incomplete Details", message: "Kindly fill data in all text fields")
        }
        Auth.auth().signIn(withEmail: loginEmailTextField.text!, password: loginPasswordTextField.text!,completion: {(result, error) in
            if let _error = error as NSError? {
                let errorMsg = self.displayErrorMessage(error: _error)
                self.displayAlertMessage(message: errorMsg)
              
            }
            else  {
                //on successful login redirect to category tab bar
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tabBarController = storyboard.instantiateViewController(withIdentifier: "tabBarController") as! ShoppingTabBarViewController
                self.navigationController?.pushViewController(tabBarController, animated: true)
                
            }
        })
       
    }
    
    
    @IBAction func loginEmailTextfieldFocus(_ sender: Any) {
        loginEmailTextField.layer.borderWidth = 1
        loginEmailTextField.layer.borderColor = UIColor.orange.cgColor
    }
    
    
    @IBAction func loginEmailTextfieldHideFocus(_ sender: Any) {
        
        loginEmailTextField.layer.borderColor = UIColor.clear.cgColor
    }
    @IBAction func loginPasswordTextfieldFocus(_ sender: Any) {
        loginPasswordTextField.layer.borderWidth = 1
        loginPasswordTextField.layer.borderColor = UIColor.orange.cgColor
    }
    
    @IBAction func loginPasswordTextfieldHideFocus(_ sender: Any) {
        loginPasswordTextField.layer.borderColor = UIColor.clear.cgColor
    }
    
   
}


//MARK: TextField Extension
// Extended functionality added for text fields to icon inside the text field

extension UITextField {
    func setIcon(_ image: UIImage) {
        
        //properties added for image view
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        
      //image container view properties which will have image inside it
       let iconContainerView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
        leftViewMode = .always
    }
}

