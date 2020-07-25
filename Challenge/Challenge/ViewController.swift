//
//  ViewController.swift
//  Challenge
//
//  Created by Sahar Hany on 7/23/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController, UITextFieldDelegate , ChildProtocol , SFSafariViewControllerDelegate{
    
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
        let msg = "Hello \(firstNameTF.text!) \(lastNameTF.text!) !"
//        helloLabel.text = msg
//        firstNameTF.resignFirstResponder()
//        lastNameTF.resignFirstResponder()
        view.endEditing(true)
        let alert = UIAlertController.init(title: "Hello!", message: msg, preferredStyle: .alert)
        
        let action_Cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            self.helloLabel.text = msg
            UIApplication.shared.open(URL(string: "http://google.com")!, options: [:], completionHandler: nil)
        })
        alert.addAction(action_Cancel)
        
        let action_Share = UIAlertAction(title: "Share", style: .default, handler: { action in
            let activityView = UIActivityViewController(activityItems: [msg], applicationActivities: nil)
            self.present(activityView, animated: true, completion: {
                self.helloLabel.text = msg
            })
        })
        alert.addAction(action_Share)
        
        present(alert, animated: true, completion: nil)

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
    
    
    @IBAction func openGoogleBtnDidPressed(_ sender: UIButton) {
        if let url = URL(string: "http://google.com"){
            let safariVC = SFSafariViewController(url: url)
            safariVC.delegate = self
            present(safariVC, animated: true, completion: nil)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        helloLabel.text = "Welcome back! \(firstName!) \(lastName!)"
    }
}

