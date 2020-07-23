//
//  ChallengeViewController.swift
//  Challenge
//
//  Created by Sahar Hany on 7/23/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

class ChallengeViewController: UIViewController , UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let firstNameLabel = UILabel()
        view.addSubview(firstNameLabel)
        firstNameLabel.text = "First Name:"
        firstNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        firstNameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true

        firstNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        
//        firstNameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
//        firstNameLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true

        firstNameLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
//        firstNameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        firstNameLabel.backgroundColor = UIColor.black

        let textField = UITextField()
        view.addSubview(textField)
        textField.delegate = self
        textField.placeholder = "Enter Your First Name"
        textField.becomeFirstResponder()
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true

        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        textField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: 20).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        textField.backgroundColor = UIColor.blue
//        textField.widthAnchor.constraint(equalToConstant: 300).isActive = true
//        textField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
