//
//  demoAppTests.swift
//  demoAppTests
//
//  Created by Adtiya Yadav on 15/12/18.
//  Copyright © 2018 Adtiya Yadav. All rights reserved.
//

import XCTest
@testable import demoApp

class demoAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //Basic test case to test postViewModel
    
    func testPostViewModel(){

        let post = Post(title: "Hello", userId: 3, id: 3, body: "World")
        let postViewModel = PostsViewModel(post: post)
        
        XCTAssertEqual(post.title, postViewModel.title)
        XCTAssertEqual(post.body, postViewModel.body)

    }

}
