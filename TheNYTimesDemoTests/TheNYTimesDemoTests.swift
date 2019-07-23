//
//  TheNYTimesDemoTests.swift
//  TheNYTimesDemoTests
//
//  Created by Admin on 7/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import XCTest
@testable import TheNYTimesDemo

class TheNYTimesDemoTests: XCTestCase {

    var storyboard: UIStoryboard?
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.storyboard = UIStoryboard(name: "Main",
                                       bundle: Bundle.main)
        
        XCTAssertNotNil(self.storyboard)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }
    

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testMasterView(){
        
        let masterViewController = self.storyboard?.instantiateViewController(withIdentifier: "MasterViewcontroller")
        
        XCTAssertNotNil(masterViewController)
        XCTAssertTrue(masterViewController is SectionsViewController)
        
    }
    
    func testFetchData()  {
        
        let expectation = self.expectation(description:  "JSON Response Received")
        Networking().performFetch(with: APIService.getSectionWith(topic: .ALL_Section, period: 1), completion: {(Result) in
            
            XCTAssertEqual(Result.status, "OK", "Data Fetch Successefully")
            //XCTAssertEqual(Result.status, "Not OK", "Data Fetch Failed")
            
            expectation.fulfill()
            
            
        },
                                  completionWith: { (Error) in
                                    XCTFail("NetWork error")
                                    
        }
            
        )
        
        self.waitForExpectations(timeout: 30) { error in
            XCTAssertNil(error)
        }
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
