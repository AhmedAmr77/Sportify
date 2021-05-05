//
//  LastEventsLeagueDetailsTests.swift
//  SportifyTests
//
//  Created by Ahmd Amr on 02/05/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import XCTest
@testable import Sportify

class LastEventsLeagueDetailsTests: XCTestCase {
    
    
    var realSportsAPI: LastEventManagerProtocol!
    var mockLastLDAPI: MockLastEventsLeagueDetailsAPI!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        realSportsAPI = SportsAPI.shared
        mockLastLDAPI = MockLastEventsLeagueDetailsAPI(shouldReturnError: false)
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        realSportsAPI = nil
        mockLastLDAPI = nil
    }
    
    //                              Real API
    func testGetLastLeagueDetails(){
        let expext = expectation(description: "last")
        
        realSportsAPI.getLastEvents(leagueId: "4328") { (res) in
            switch res {
            case .success(let response):
                expext.fulfill()
                XCTAssertEqual(response?.events?.count, 15)
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testGetLastFail(){
        let expect = expectation(description: "last")
        
        realSportsAPI.getLastEvents(leagueId: "") { (res) in
            switch res {
            case .success(_):
                XCTFail()
            case .failure(let err):
                expect.fulfill()
                XCTAssertNotNil(err)
            }
        }
        waitForExpectations(timeout: 7)
    }
    
    //                              Mock API
    func testMockGetLast(){
        mockLastLDAPI.getLastEvents(leagueId: "", completion: { (res) in
            switch res {
            case .success(let response):
                XCTAssertNotEqual(response?.events?.count, 0)
            case .failure(_):
                XCTFail()
            }
        })
    }
}
