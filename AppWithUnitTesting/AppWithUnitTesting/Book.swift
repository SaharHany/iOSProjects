//
//  Book.swift
//  AppWithUnitTesting
//
//  Created by Sahar Hany on 7/24/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import Foundation
class Book: NSObject {
    var title      : String?
    var pagesCount : Int?
    
    override init() {
        title      = "Book_Title"
        pagesCount = 123
    }
    
    init(title : String , pagesCount : Int) {
        self.title      = title
        self.pagesCount = pagesCount
    }
}
