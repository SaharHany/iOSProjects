//
//  ViewController.swift
//  Challenge
//
//  Created by Sahar Hany on 7/23/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate , ChildProtocol{
    
    var vc: ParentProtocol?
    
    @IBOutlet weak var helloLabel: UILabel!
    
    @IBOutlet weak var firstNameTF: UITextField!
    
    @IBOutlet weak var lastNameTF: UITextField!
    
    @IBOutlet weak var myBtn: UIButton!
    
    var firstName : String?
    var lastName  : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstNameTF.delegate = self
        lastNameTF.delegate  = self
        firstNameTF.becomeFirstResponder()
        let label   = UILabel()
//        label.frame = CGRect(x: 100, y: 350, width: 200, height: 100)
        label.text  = "Hello from the code!"
        label.textColor = UIColor.white
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: myBtn.bottomAnchor, constant: 10).isActive = true
//        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
//        label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16).isActive = true
        label.heightAnchor.constraint(equalToConstant: 60).isActive = true
        label.widthAnchor.constraint(equalToConstant: 300).isActive = true
        label.textAlignment = NSTextAlignment.center
        label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        setFields()
        myBtn.setTitle( "Say Hello", for: .normal)

    }

    @IBAction func myButtondidPressed(_ sender: Any) {
        helloLabel.text = "Hello \(firstNameTF.text!) \(lastNameTF.text!) !"
//        firstNameTF.resignFirstResponder()
//        lastNameTF.resignFirstResponder()
        view.endEditing(true)

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func setFields(){
        if firstName != nil {
            firstNameTF.text = firstName
        }
        if lastName != nil {
            lastNameTF.text = lastName
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if vc != nil{
            vc?.highlightCellAtIndexPath()
        }
    }

    func setData(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName  = lastName
    }
    
}

