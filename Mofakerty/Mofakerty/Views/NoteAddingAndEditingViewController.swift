//
//  NoteAddingAndEditingViewController.swift
//  Mofakerty
//
//  Created by Sahar Hany on 7/18/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit
protocol NoteDelegation {
    func saveNoteFromUser(note:Note)
    func updateNoteFromUser(note:Note, updatedNote : Note)

}

enum ViewControllerOpenMode {
    case OpenMode_AddingNote
    case OpenMode_EditingNote
}

class NoteAddingAndEditingViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var noteTitle_TF: UITextField!
    @IBOutlet weak var noteBody_TV: UITextView!
    var delegate : NoteDelegation!
    var openMode : ViewControllerOpenMode = ViewControllerOpenMode.OpenMode_AddingNote
    var note     : Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.largeTitleDisplayMode = .never
        if openMode == ViewControllerOpenMode.OpenMode_AddingNote {
            self.title = "Add Note"
        }else{
            self.title = "Edit Note"
            if note != nil{
                noteTitle_TF!.text = note!.title
                noteBody_TV!.text  = note!.body
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        let newTitle = noteTitle_TF!.text ?? ""
        if !(newTitle.isEmpty) {
            if openMode == ViewControllerOpenMode.OpenMode_AddingNote{
                let newNote = Note(title: noteTitle_TF!.text!, body: noteBody_TV!.text ?? "")
                delegate.saveNoteFromUser(note: newNote)
            }else {
                let newNote = Note(title: noteTitle_TF!.text!, body: noteBody_TV!.text ?? "")
                delegate.updateNoteFromUser(note: note!, updatedNote: newNote)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func setupViewWith(note : Note?, delegate : NoteDelegation){
        if note != nil {
            self.openMode = ViewControllerOpenMode.OpenMode_EditingNote
            self.note = note!
        }else{
            self.openMode = ViewControllerOpenMode.OpenMode_AddingNote
            self.note = nil
        }
        self.delegate = delegate
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (note == nil) {
            self.noteBody_TV.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
