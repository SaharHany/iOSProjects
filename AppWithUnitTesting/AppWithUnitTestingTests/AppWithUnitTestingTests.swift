//
//  AppWithUnitTestingTests.swift
//  AppWithUnitTestingTests
//
//  Created by Sahar Hany on 7/24/20.
//  Copyright © 2020 Studying. All rights reserved.
//

import XCTest

class AppWithUnitTestingTests: XCTestCase {

//    override func setUp() {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }
//
//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

    func testBook(){
        let book = Book()
        XCTAssertEqual(book.title, "Book_Title")
        
        let book2 = Book(title: "myBook", pagesCount: 200)
        XCTAssertEqual(book2.pagesCount, 200)
    }
}
