//
//  iTunes_SearchTests.swift
//  iTunes SearchTests
//
//  Created by Austin Potts on 2/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search

// What can we test?
//1. Decoding
//2. Creating the URL
//3. Setting the result properly and giving back an error

class iTunes_SearchTests: XCTestCase {

    
    // This is usilg URL Session
    func testPerformSearch(){
    
        let controller = SearchResultController()
    
        //1 Change this to iTunesSearchExpectation so you know what you are using it for
        let expectation = self.expectation(description: "Waiting for iTunes api to return data")
        
        //3
        controller.performSearch(for: "GarageBand", resultType: .software) {
            XCTAssert(!controller.searchResults.isEmpty)
            print("Test Finsihed")
            
            expectation.fulfill()
        }
        
        //2
        wait(for: [expectation], timeout: 5)
        
        XCTAssertTrue(controller.searchResults.count > 0, "Expecting at least one result")
        
    }
    
    func testSearchResultsController(){
        let mock = MockDataLoader()
        mock.data = goodResultData
        
        let controller = SearchResultController(dataLoader: mock)
        let resultsExpectation = expectation(description: "Wait for search result")
        
        controller.performSearch(for: "GarageBand", resultType: .software) {
        
            
            resultsExpectation.fulfill()
        }
        
        wait(for: [resultsExpectation], timeout: 5)
        
        XCTAssertTrue(controller.searchResults.count == 2, "Expecting two result")
        XCTAssertEqual("GarageBand", controller.searchResults[0].title)
        XCTAssertEqual("Apple", controller.searchResults[0].artist)
        XCTAssertNil(controller.error)
        
        
        
    }
    
    
    func testBadJSONData(){
        let mock = MockDataLoader()
               mock.data = badResultData
               
               let controller = SearchResultController(dataLoader: mock)
               let resultsExpectation = expectation(description: "Wait for search result")
               
               controller.performSearch(for: "GarageBand", resultType: .software) {
               
                   
                   resultsExpectation.fulfill()
               }
               
               wait(for: [resultsExpectation], timeout: 5)
        
        XCTAssertTrue(controller.searchResults.isEmpty, "We are not expecting results")
        XCTAssertNotNil(controller.error, "There should be an error")
        
    }
    
    func testNoJSONData(){
        let mock = MockDataLoader()
        mock.data = noResultData
        
        let controller = SearchResultController(dataLoader: mock)
        let resultsExpectation = expectation(description: "Wait for search result")
        
        controller.performSearch(for: "jsadsjdhjsd888", resultType: .software) {
        
            
            resultsExpectation.fulfill()
        }
        
        wait(for: [resultsExpectation], timeout: 5)
        XCTAssertTrue(controller.searchResults.isEmpty, "We are expecting empty results")
       // XCTAssertNotNil(controller.error, "There should be an error from no results")
        
    }
    
    // Usually using networking in unit test isnt good
    // We need to wait for api to finish or api is not ready yet
    // Essential in continuous integration - automate the way to build and test apps
    

}
