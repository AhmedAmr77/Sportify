//
//  AllSportsTests.swift
//  SportifyTests
//
//  Created by Amr Muhammad on 5/1/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import XCTest
@testable import Sportify

class AllSportsTests: XCTestCase {
    var realSportsAPI:SportsAPI!
    var mockSportsAPI:MockAllSportsAPI!
    
    override func setUpWithError() throws {
        realSportsAPI = SportsAPI.shared
        mockSportsAPI = MockAllSportsAPI(shouldReturnError: false)
    }

    override func tearDownWithError() throws {
        realSportsAPI = nil
        mockSportsAPI = nil
    }
    
    func testAllsports(){
        let expect = expectation(description: "all sports")
        realSportsAPI.getAllSports { (reseult) in
            switch reseult{
            case .success(let sports):
                expect.fulfill()
                XCTAssertEqual(sports?.sports.count, 20)
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testMockAllsports(){
        mockSportsAPI.getAllSports { (reseult) in
            switch reseult{
            case .success(let sports):
                XCTAssertEqual(sports?.sports.count, 2)
            case .failure(_):
                XCTFail()
            }
        }
    }

    

}
