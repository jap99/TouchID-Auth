//
//  AuthenticationVC.swift
//  GoodProject
//
//  Created by Javid Poornasir on 9/26/16.
//  Copyright © 2016 Javid Poornasir. All rights reserved.
//

import UIKit
import LocalAuthentication

class AuthenticationVC: UIViewController {
    
    
    // ---------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callTouchID()
        
    }
    // ---------------------------------------------------------------------------------------------------------
    func callTouchID() {
        // Declare a context to check if we have a touch ID sensor; if yes, ask for touch ID else display error saying device has no touch ID
        let authenticationContext = LAContext()
        
        var error: NSError?
        
        // Check if there's a touch ID sensor that user can auth with & if we can evaluate policy then do so
        if authenticationContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            // Show touch ID popup, navigate to success VC, handle any errors
            authenticationContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Access your app with the touch of your finger!", reply: { (success, error) in
                
                if success {
                    
                   
                    self.navigateToAuthenticatedVC()
                    
                } else {
                    
                    // We'll need to return NSError to evaluatePolicy
                    if let error = error as? NSError {
                        
                        let message = self.errorMessageForLAErrorCode(errorCode: error.code)
                        self.showAlertViewAfterEvaluatingPolicyWithMessage(message: message)
                    }
                }
            })
            
        } else {
            // Show alert for no biometrics
            showAlertViewForNoBiometrics()
            return
        }
    }
 
    // ---------------------------------------------------------------------------------------------------------
    func showAlertViewAfterEvaluatingPolicyWithMessage(message: String) {
        // Each touch ID error will have a different message; passed in using showAlertWithTitle()
        showAlertWithTitle(title: "Error", message: message)
        
        // errorMessageForLAErrorCode() will send us this message
    }
    // ---------------------------------------------------------------------------------------------------------
    func errorMessageForLAErrorCode(errorCode: Int) -> String {
        
        // Make a variable to store the message
        var message = ""
        
        switch errorCode {
        case LAError.appCancel.rawValue:
            message = "Authencation was cancelled by the application"
            
        case LAError.authenticationFailed.rawValue:
            message = "The user failed to provide valid credentials"
            
        case LAError.invalidContext.rawValue:
            message = "The context is invalid"
            
        case LAError.passcodeNotSet.rawValue:
            message = "Passcode is not set on the device"
            
        case LAError.systemCancel.rawValue:
            message = "Authentication was canceled by the system"
            
        case LAError.touchIDLockout.rawValue:
            message = "Too many failed attempts"
            
        case LAError.touchIDNotAvailable.rawValue:
            message = "Touch ID is not available on this device"
            
        case LAError.userCancel.rawValue:
            message = "The user canceled"
            
        case LAError.userFallback.rawValue:
            message = "The user chose to use the fallback"
            
        default:
            message = "Error code unknown"
        }
        return message // This message will be eventually passed into showAlertViewAfterEvalutingPolicyWithMessage()
    }
    // ---------------------------------------------------------------------------------------------------------
    // To push to our SuccessVC
    func navigateToAuthenticatedVC() {
        if let loggedInVC = storyboard?.instantiateViewController(withIdentifier: "ProductsVC") {
            DispatchQueue.main.async {
                self.present(loggedInVC, animated: true, completion: nil)
                
            }
        }
    }
    // ---------------------------------------------------------------------------------------------------------
    // This is our alert view for no touch ID
    func showAlertViewForNoBiometrics() {
        showAlertWithTitle(title: "Error", message: "This device does not have a touch ID sensor.")
    }
    // ---------------------------------------------------------------------------------------------------------
    
    // How to show the alert --- pass in a title and message then it'll know what to do
    func showAlertWithTitle(title: String, message: String) {
        
        // Create alert popup
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Action for when we tap OK button
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // Connect popup & alert action
        alertVC.addAction(okAction)
        
        DispatchQueue.main.async {
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    // ---------------------------------------------------------------------------------------------------------
    
    
    
    
    
    
    
    
    
}

