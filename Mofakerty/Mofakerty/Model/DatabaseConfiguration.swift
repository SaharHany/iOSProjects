//
//  DatabaseConfiguration.swift
//  Mofakerty
//
//  Created by Sahar Hany on 7/18/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import Foundation
class DatabaseConfiguration: NSObject {
    
    let notesKey : String = "notes"
    static let sharedInstance : DatabaseConfiguration =  {
        let instance = DatabaseConfiguration()
        return instance
    }()
    
    private override init() {
    }
    
    func saveNote(note: Note){
        let notes = loadNotes()
        UserDefaults.standard.removeObject(forKey:notesKey)
        
        if notes.count > 0{
            let notesUpdated = NSMutableArray(array: notes)
            notesUpdated.add(note)
            save(notes: notesUpdated as! [Note])
        }else{
            save(notes: [note])
        }
    }
    
    func save(notes : [Note]){
        let userDefaults = UserDefaults.standard
        let encodedNotes : Data = NSKeyedArchiver.archivedData(withRootObject: notes)
        userDefaults.set(encodedNotes, forKey: notesKey)
        userDefaults.synchronize()
    }
    
    func loadNotes() -> [Note] {
        
        let userDefaults = UserDefaults.standard
        let decoded      = userDefaults.data(forKey: notesKey)
        let decodedNotes = NSKeyedUnarchiver.unarchiveObject(with: decoded ?? Data()) as? [Note]
        
        return decodedNotes ?? []
    }
    
    func clearNotes(){
        UserDefaults.standard.removeObject(forKey:notesKey)
    }
    
    func deleteNote(note : Note){
           
      let notes = loadNotes()
      UserDefaults.standard.removeObject(forKey:notesKey)
        
      if notes.count > 0{
        let notesUpdated = NSMutableArray(array: notes)
        for currNote in notesUpdated {
            let curr = currNote as! Note
            if (curr.title == note.title) && (curr.body == note.body) {
                notesUpdated.remove(currNote)
            }
        }
          save(notes: notesUpdated as! [Note])
      }
    }
    
    func updateNote(note: Note, updatedNote: Note){
        deleteNote(note: note)
        saveNote(note: updatedNote)
    }
}
