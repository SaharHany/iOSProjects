//
//  HomeViewController.swift
//  Mofakerty
//
//  Created by Sahar Hany on 7/18/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource {

    
    @IBOutlet weak var notesTable: UITableView!
    let reuseIdentifier : String = "NoteCell"
    var notesDataSource : [Note] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.notesTable.delegate = self
        self.notesTable.dataSource = self
        self.notesDataSource = loadNotes();

        self.title = "Notes"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.addButtonsToBar()
        
    }

    func loadNotes() ->[Note] {
        let Note1 = Note(title: "Note1", body: "body1")
        let Note2 = Note(title: "Note2", body: "body2")
        let Note3 = Note(title: "Note3", body: "body3")
        return [Note1,Note2,Note3]
    }
    
    func addButtonsToBar(){
        let addBtn  = UIBarButtonItem(barButtonSystemItem : .add, target: self, action:#selector(onAddNoteButtonAction))
        
        self.navigationItem.rightBarButtonItem = addBtn
        
        let editBtn = UIBarButtonItem(barButtonSystemItem : .edit, target: self, action:#selector(onEditButtonAction))
        
        self.navigationItem.leftBarButtonItem = editBtn
        
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
    }
    
    @objc func onEditButtonAction() {
        print("edit button action")

    }
    
    @objc func onAddNoteButtonAction() {
        //open edit view empty
        print("add button action")
    }
    
    
    
}

