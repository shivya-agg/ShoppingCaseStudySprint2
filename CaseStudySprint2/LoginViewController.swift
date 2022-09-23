//
//  ViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/20/22.
//

import UIKit

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

        /*
         let deviceAuthentication = DeviceAuthentication()
         deviceAuthentication.deviceAuthenticationByPasscode()
         deviceAuthentication.deviceAuthenticationByFaceID()
         */
        
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
        
        //checking if email is valid
        else if !emailValidation(emailid: loginEmailTextField.text!) {
            displayAlert(title: "Invalid Email Id", message: "Give proper emaild id")
        }
        
        //checking if password is alphanumeric
        else if !passwordValidation(password: loginPasswordTextField.text!){
            displayAlert(title: "Invalid Password", message: "Password should be alphanumeric with minimum 6 characters")
        }
        
        //checking if email exists then validating the password entered is correct or not
        else if (emailExists(emailId: loginEmailTextField.text!) && !emailExistPasswordCheck(password: loginPasswordTextField.text!)){
            displayAlert(title: "Wrong Password", message: "Kindly recheck your password")
        }
        
        //checking if user does not exist then show alert to sign up
        else if !emailExists(emailId: loginEmailTextField.text!) {
            displayAlert(title: "User not found", message: "User does not exist. Please sign up.")
        }
        
        //on successful sign up navigate to category controller
        else {
            
            // validating with email and password in firebase if user is valid or not
           // let firebaseAuthentication = FirebaseAuthentication()
           // firebaseAuthentication.firebaseLoginValidation(email: loginEmailTextField.text!, password: loginPasswordTextField.text!)
            
            let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
            self.navigationController?.pushViewController(tabBarController, animated: true)
        }
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

