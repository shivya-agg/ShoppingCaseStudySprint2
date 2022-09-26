//
//  SignUpViewController.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/21/22.
//

import UIKit
import Firebase
import CoreData

class SignUpViewController: UIViewController {

    
    //MARK: IBOutlets
    @IBOutlet weak var userauthenticationImage: UIImageView!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var signupNameTextField: UITextField!
    @IBOutlet weak var signupEmailIdTextField: UITextField!
    @IBOutlet weak var signupMobileTextField: UITextField!
    @IBOutlet weak var signupPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    //MARK: Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signupNameTextField.layer.cornerRadius = 10
        signupEmailIdTextField.layer.cornerRadius = 10
        signupMobileTextField.layer.cornerRadius = 10
        signupPasswordTextField.layer.cornerRadius = 10
        confirmPasswordTextField.layer.cornerRadius = 10
        
        //setting image icons on each text fields
        signupNameTextField.setIcon(UIImage(named: "signupUser.png")!)
        signupEmailIdTextField.setIcon(UIImage(named: "signupMail.png")!)
        signupMobileTextField.setIcon(UIImage(named: "mobile.png")!)
        signupPasswordTextField.setIcon(UIImage(named: "signupPassword.png")!)
        confirmPasswordTextField.setIcon(UIImage(named: "confirmPass.png")!)
        
        //hiding back button
        navigationItem.hidesBackButton = true
        
        //main image properties
        userauthenticationImage.layer.borderWidth = 0.5
        userauthenticationImage.layer.cornerRadius = userauthenticationImage.frame.height / 2
        userauthenticationImage.clipsToBounds = true
        
        //MARK: Button properties
        //signup button properties
        signupButton.layer.cornerRadius = 15
        
        //back button properties
        backButton.layer.cornerRadius = 15
    }
    
    //MARK: IBActions
    @IBAction func signupButtonClicked(_ sender: Any) {
        
        //empty field check
        if signupEmptyFieldCheck(name: signupNameTextField.text!, email: signupEmailIdTextField.text!, mobile: signupMobileTextField.text!, password: signupPasswordTextField.text!, confirmPassword: confirmPasswordTextField.text!) {
            
            displayAlert(title: "Incomplete Data", message: "Kindly enter data in all fields")
        }
        
        //checks name validation
        if !nameValidation(username: signupNameTextField.text!) {
            displayAlert(title: "Invalid Name", message: "Name should contain minimum 4 characters")
        }
        //checks mobile validation if invalid returns alert message
        else if !mobileValidation(mobile: signupMobileTextField.text!){
            displayAlert(title: "Invalid mobile", message: "It should be 10 digits")
        }
        
        //checks password validation
        else if !passwordValidation(password: signupPasswordTextField.text!){
            displayAlert(title: "Invalid Password", message: "Password should be alphanumeric with minimum 6 characters including a special character")
        }
        
        //checks email validation
        else if !emailValidation(emailid: signupEmailIdTextField.text!){
            displayAlert(title: "Invalid Email", message: "Invalid email id eg john.rodger@gmail.com")
        }
        
        //checking if email id already exists
        else if emailExists(emailId: signupEmailIdTextField.text!){
            displayAlert(title: "Duplicate Email", message: "Email Id already exists")
            let array = DBOperationsManager.dbManagerSharedInstance().fetchUserRecord()
            print(array)
        }
        
        //checking password and confirm password is a match if not gives alert message
        else if !confirmPasswordValidation(password: signupPasswordTextField.text!, confirmPass: confirmPasswordTextField.text!){
            displayAlert(title: "Mismatch", message: "Passwords mismatch.Try again")
        }
        
        //else saving the data in coredata and firebase
        else {
            //saving firebase data
            /*let firebaseAuthentication = FirebaseAuthentication()
            firebaseAuthentication.firebaseUserRegistration(name: signupNameTextField.text!, email: signupEmailIdTextField.text!, mobile: signupMobileTextField.text!, password: signupPasswordTextField.text!)*/
            
            //inserting user data in core data
            DBOperationsManager.dbManagerSharedInstance().insertUserData(name: signupNameTextField.text!, emailId: signupEmailIdTextField.text!, mobile: signupMobileTextField.text!, password: signupPasswordTextField.text!)
            
            //Tab bar controller - category
            let tabBarController = self.storyboard?.instantiateViewController(withIdentifier: "tabBarController") as! UITabBarController
            self.navigationController?.pushViewController(tabBarController, animated: true)
            
        }
    }
    
  
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
