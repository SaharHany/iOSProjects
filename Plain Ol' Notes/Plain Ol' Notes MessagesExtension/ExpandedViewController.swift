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
    func saveMessage(title:String , note:String)

}

class ExpandedViewController: UIViewController,UITextViewDelegate {

    var expandedDelegate: ExpandedDelegate?
    let titleKey   : String = "title"
    let noteKey    : String = "note"
    
    @IBOutlet weak var noteTitle_TF: UITextField!
    @IBOutlet weak var noteBody_TV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sendBtnAction(_ sender: UIButton) {
        expandedDelegate?.sendMessage(title: noteTitle_TF.text!, note: noteBody_TV.text!)
    }
    
    
    @IBAction func saveBtnAction(_ sender: UIButton) {
        expandedDelegate?.saveMessage(title: noteTitle_TF.text!, note: noteBody_TV.text!)
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

    func didOpen(from url:URL){
        let component = URLComponents(url: url, resolvingAgainstBaseURL: false)
        for queryItem in (component?.queryItems!)! {
            if queryItem.name == titleKey {
                noteTitle_TF.text = queryItem.value
            }else if queryItem.name == noteKey {
                noteBody_TV.text  = queryItem.value
            }
        }
    }
    
    func clearText(){
        noteTitle_TF.text = ""
        noteBody_TV.text  = "Note"
    }
}
