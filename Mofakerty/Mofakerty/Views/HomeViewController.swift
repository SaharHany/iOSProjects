//
//  HomeViewController.swift
//  Mofakerty
//
//  Created by Sahar Hany on 7/18/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource, NoteDelegation {
    
    @IBOutlet weak var notesTable: UITableView!
    let reuseIdentifier : String = "NoteCell"
    var notesDataSource : [Note] = []
    var fileUrl         : URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Notes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always

        let baseURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        fileUrl = baseURL.appendingPathComponent("notes.txt")
        
        self.notesTable.delegate = self
        self.notesTable.dataSource = self

        self.addButtonsToBar()
        self.navigationItem.leftBarButtonItem = editButtonItem
        reloadContent()
    }
    
    func loadNotes() ->[Note] {
        return DatabaseConfiguration.sharedInstance.loadNotes()
//        return FileManagerConfiguration.sharedInstance.loadFromFileWith(url: fileUrl)
    }
    
    func addButtonsToBar(){
        if !(notesTable.isEditing){
            let addBtn  = UIBarButtonItem(barButtonSystemItem : .add, target: self, action:#selector(onAddNoteButtonAction))
            
            self.navigationItem.rightBarButtonItem = addBtn
        }else{
            let deleteAllBtn  = UIBarButtonItem(barButtonSystemItem : .trash, target: self, action:#selector(onAddNoteButtonAction))
            self.navigationItem.rightBarButtonItem = deleteAllBtn
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier:reuseIdentifier) ?? UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)

        cell.textLabel?.text = self.notesDataSource[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notesDataSource.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //open edit view with data of note
        let vc = storyboard?.instantiateViewController(identifier: "NoteAddingAndEditingViewController") as? NoteAddingAndEditingViewController
        vc?.setupViewWith(note: notesDataSource[indexPath.row],delegate: self)
        self.navigationController?.pushViewController(vc!, animated: true)
       
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DatabaseConfiguration.sharedInstance.deleteNote(note: notesDataSource[indexPath.row])
            notesDataSource.remove(at: indexPath.row)
            notesTable.deleteRows (at: [indexPath], with: .fade)
        }
    }
    
    @objc func onAddNoteButtonAction() {
        //open edit view empty
        if notesTable.isEditing{
            DatabaseConfiguration.sharedInstance.clearNotes()
            self.notesDataSource = loadNotes()
            notesTable.reloadData()
        }else{
            let vc = storyboard?.instantiateViewController(identifier: "NoteAddingAndEditingViewController") as? NoteAddingAndEditingViewController
            vc?.setupViewWith(note: nil,delegate: self)

            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing( editing, animated: animated)
        notesTable.setEditing(editing, animated: animated)
        self.addButtonsToBar()
    }
    
    
    func saveNoteToDB (note : Note){
        DatabaseConfiguration.sharedInstance.saveNote(note: note)
    }
    
    func updateNoteToDB (note:Note, updatedNote : Note){
        DatabaseConfiguration.sharedInstance.updateNote(note: note, updatedNote: updatedNote)
    }
        
    func saveToFile(note : Note){
        FileManagerConfiguration.sharedInstance.saveToFileWith(url: fileUrl,notes: [note])
        
    }
    
    func reloadContent(){
        self.notesDataSource = loadNotes()
        notesTable.reloadData()
    }
      
    func saveNoteFromUser(note:Note){
        saveNoteToDB(note: note)
        reloadContent()
    }
    func updateNoteFromUser(note:Note, updatedNote : Note){
        updateNoteToDB(note: note,updatedNote: updatedNote)
        reloadContent()
    }
}

