//
//  myCVUITests.swift
//  myCVTests
//
//  Created by Sandy Lee on 2019-09-11.
//  Copyright © 2019 Sandy Lee. All rights reserved.
//
import XCTest

class myCVUITests: XCTestCase {
    
    var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        // XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    
}
