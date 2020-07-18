//
//  FileManagerConfiguration.swift
//  Mofakerty
//
//  Created by Sahar Hany on 7/18/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import Foundation
class FileManagerConfiguration: NSObject {
    
    static let sharedInstance : FileManagerConfiguration = {
       let instance = FileManagerConfiguration()
        return instance
    }()
    
    private override init() {
        
    }
    
    func saveToFileWith(url : URL , notes : [Note]) -> Bool {
        let encodedNotes : Data = NSKeyedArchiver.archivedData(withRootObject: notes)
        do{
            try  encodedNotes.write(to: url)
            print("writing successfully on file")
            return true
        }catch{
            print("error while writing on file")
            return false
        }
    }
    
    func loadFromFileWith(url : URL) -> [Note] {
        do{
            let decoded      = try Data(contentsOf: url)
            let decodedNotes = NSKeyedUnarchiver.unarchiveObject(with: decoded ) as? [Note]
            return decodedNotes ?? []
            
        }catch {
            print("error loading")
            return []
        }
    }
    
    
}
