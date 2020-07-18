//
//  Note.swift
//  Mofakerty
//
//  Created by Sahar Hany on 7/18/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import Foundation
class Note: NSObject {
    
    var title : String
    var body  : String
    
    init(title : String , body : String) {
        self.title = title
        self.body  = body
    }
}
