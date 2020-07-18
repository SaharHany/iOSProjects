//
//  Note.swift
//  Mofakerty
//
//  Created by Sahar Hany on 7/18/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import Foundation
class Note: NSObject, NSCoding{
    
    var title : String
    var body  : String
    
    init(title : String , body : String) {
        self.title = title
        self.body  = body
    }
    
    override convenience init() {
           self.init(title: "",body: "")
       }
    
    required convenience init?(coder : NSCoder) {
        let title = coder.decodeObject(forKey: "title") as! String
        let body  = coder.decodeObject(forKey: "body" ) as! String
        self.init(title: title,body: body)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(title, forKey: "title")
        coder.encode(body, forKey: "body")
    }
}
