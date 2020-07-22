//
//  ViewController.swift
//  Challenge
//
//  Created by Sahar Hany on 7/23/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstNameTF.delegate = self
        lastNameTF.delegate  = self
        firstNameTF.becomeFirstResponder()
    }

    @IBAction func myButtondidPressed(_ sender: Any) {
        helloLabel.text = "Hello \(firstNameTF.text!) \(lastNameTF.text!) !"
        firstNameTF.resignFirstResponder()
        lastNameTF.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

