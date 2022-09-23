//
//  DeviceAuthentication.swift
//  CaseStudySprint2
//
//  Created by Capgemini-DA226 on 9/20/22.
//

import Foundation
import LocalAuthentication
import UIKit

class DeviceAuthentication: UIViewController {
    
    //MARK: Variables
    let context: LAContext = LAContext()
    var authenticationError: NSError?
    let authenticationStr = "Authentication is needed to access app"  //MARK: Authentication string
    
    //MARK: Authentication functions
    //MARK: Passcode Authentication
    func deviceAuthenticationByPasscode () {
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &authenticationError) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: authenticationStr, reply: { success, error in
                if success {
                    self.showAlert(title: "Success", message: "User authenticated successfully")
                    
                }
                else {
                    if let error = error {
                        let message = self.displayMessageWithErrorCode(errorCode: error as! Int)
                        self.showAlert(title: "Error", message: message)
                    }
                }
            })
        }
        
    }
    
    
    //MARK: Face/Touch ID authentication
    func deviceAuthenticationByFaceID () {
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authenticationError) {
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: authenticationStr, reply: { success, error in
                if success {
                    self.showAlert(title: "Success", message: "Biometrics authentication successful")
                }
            })
        }
        else {
            self.showAlert(title: "Error", message: "Biometrics not enrolled")
        }
    }
    
    //this function returns proper error message related to error code
    func displayMessageWithErrorCode(errorCode: Int) -> String {
        
        var errorMessage = ""
        switch errorCode {
            case LAError.appCancel.rawValue:
                errorMessage = "Authentication was cancelled by app"
            case LAError.systemCancel.rawValue:
                errorMessage = "System canceled authentication"
            case LAError.userCancel.rawValue:
                errorMessage = "User tapped the cancel button in the authentication dialog"
            case LAError.authenticationFailed.rawValue:
                errorMessage = "User failed to provide valid credentials"
            case LAError.passcodeNotSet.rawValue:
                errorMessage = "Passcode isn't set on device"
            default:
                errorMessage = "Authentication Failed"
        }
        
        return errorMessage
    }

    //this function displays alert message for success/error of authentication
    func showAlert(title: String, message: String) {
        DispatchQueue.main.async {
        let alertBox = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertBox.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: nil))
        UIApplication.shared.connectedScenes.flatMap{( $0 as? UIWindowScene)?.windows ?? [] }.first {$0.isKeyWindow}?.rootViewController?.present(alertBox, animated: true, completion: nil)
        }
    }
 
   
}
