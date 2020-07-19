//
//  ViewController.swift
//  Plain Ol' Pasteboard
//
//  Created by Sahar Hany on 7/19/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate{

    @IBOutlet weak var pasteBoard_TV: UITextView!
    var pastedStrings : [String] = []
    let key : String = "data_key"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let loadedStrings = UserDefaults.standard.stringArray(forKey: key){
            pastedStrings.append(contentsOf: loadedStrings)
        }
        
        showText()
    }

    func showText(){
//        pasteBoard_TV.text = UIPasteboard.general.string
        var text = ""
        for str in pastedStrings {
            text.append("\(str)\n\n")
        }
        pasteBoard_TV.text = text
    }
    
    func addText(){
        guard let text = UIPasteboard.general.string , !pastedStrings.contains(text) else {
            return
        }
        pastedStrings.append(text)
        UserDefaults.standard.set(pastedStrings, forKey: key)
        showText()
    }
    @IBAction func onTrashButtonAction(_ sender: UIBarButtonItem) {
        pastedStrings.removeAll()
        pasteBoard_TV.text = ""
        UserDefaults.standard.removeObject(forKey: key)
    }
    
    
}

