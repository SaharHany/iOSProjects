//
//  ExpandedViewController.swift
//  Plain Ol' Notes MessagesExtension
//
//  Created by Sahar Hany on 6/27/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

protocol ExpandedDelegate {
    func sendMessage(title:String , note:String)
}

class ExpandedViewController: UIViewController,UITextViewDelegate {

    var expandedDelegate: ExpandedDelegate?
    
    @IBOutlet weak var noteTitle_TF: UITextField!
    @IBOutlet weak var noteBody_TV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sendBtnAction(_ sender: UIButton) {
        expandedDelegate?.sendMessage(title: noteTitle_TF.text!, note: noteBody_TV.text!)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }

}
