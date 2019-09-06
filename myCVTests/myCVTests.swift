//
//  myCVTests.swift
//  myCVTests
//
//  Created by Sandy Lee on 2019-09-03.
//  Copyright © 2019 Sandy Lee. All rights reserved.
//

import XCTest
@testable import myCV

var sut:URLSession!

class myCVTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = URLSession(configuration: .default)
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Asynchronous test: success fast, failure slow
    func testValidJsonCall() {
        // given
        let url =
            URL(string: "https://gist.githubusercontent.com/fslee18/16fc9ff447df62997674c87ff8731bcf/raw/2990bb87deba7976b7384dbed433e051f3b72d50/myCVapp.json")
        // 1
        let promise = expectation(description: "Status code: 200")
        
        // when
        let dataTask = sut.dataTask(with: url!) { data, response, error in
            // then
            if let error = error {
                XCTFail("Error: \(error.localizedDescription)")
                return
            } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    // 2
                    promise.fulfill()
                } else {
                    XCTFail("Status code: \(statusCode)")
                }
            }
        }
        dataTask.resume()
        // 3
        wait(for: [promise], timeout: 5)
    }
    
    func testCallJsonToCompletes() {
        // given
        let url =
            URL(string: "https://gist.githubusercontent.com/fslee18/16fc9ff447df62997674c87ff8731bcf/raw/2990bb87deba7976b7384dbed433e051f3b72d50/myCVapp.json")
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        
        // when
        let dataTask = sut.dataTask(with: url!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        
        // then
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
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
    
    

}
