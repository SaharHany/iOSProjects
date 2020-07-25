//
//  BuiltinBrowserViewController.swift
//  Challenge
//
//  Created by Sahar Hany on 7/24/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit
import WebKit
class BuiltinBrowserViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var url_TF: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        url_TF.delegate = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func openURLButtonDidPressed(_ sender: UIButton) {
        
        if let url = URL(string: url_TF!.text!)  {
            webview.load(URLRequest(url: url))
        }else{
            showError()
        }
    }
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        resetError()
    }
    
    
    func showError(){
        errorLabel.text = "Please enter a valid url"
    }
    
    func resetError(){
        errorLabel.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
