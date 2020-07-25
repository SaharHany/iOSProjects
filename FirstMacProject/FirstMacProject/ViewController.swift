//
//  ViewController.swift
//  FirstMacProject
//
//  Created by Sahar Hany on 7/25/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import Cocoa

class ViewController: NSViewController , NSTextFieldDelegate{

    
    @IBOutlet weak var welcomeImageView: NSImageCell!
    @IBOutlet weak var welcomeLabel: NSTextField!
    @IBOutlet weak var nameTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameTextField.delegate = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    

    @IBAction func loginBtnAction(_ sender: NSButton) {
        if let name =  nameTextField?.stringValue , name != "" {
            welcomeLabel.stringValue = "Welcome \(name)!"
            welcomeImageView.image = NSImage(named: "ic_happyGirl")
        }else{
            welcomeLabel.stringValue = "Welcome"
            welcomeImageView.image = NSImage(named: "ic_sadGirl")
        }
    }
    
}

