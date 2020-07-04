//
//  ViewController.swift
//  BioAuth
//
//  Created by Sahar Hany on 7/3/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    var context  =  LAContext()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        context.localizedCancelTitle   = "End Session"
        context.localizedFallbackTitle = "Use Passcode (2)"
        context.localizedReason        = "The app needs your authentication"
        evaluatePolicy()
    }


    func evaluatePolicy() {
        var errorCanEval : NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &errorCanEval) {
            // incase of can Evaluate policy
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Fallback title - override reason ") { success, error in
                print(success)
                
                if let err = error {
                    let evalErrorCode = LAError(_nsError: err as NSError)
                    switch evalErrorCode.code {
                    case LAError.Code.userCancel:
                        print("user cancelled")
                    case LAError.Code.userFallback:
                        print("fallback")
                    case LAError.Code.authenticationFailed:
                        print("failed to authenticate")
                    default:
                        print("other error")
                    }
                    
                }
            }
        }else{
            //incase of can't evaluate policy
            print("Cannot evaluate Policy...")
            print(errorCanEval?.localizedDescription ?? "no error description")
        }
    }
}

