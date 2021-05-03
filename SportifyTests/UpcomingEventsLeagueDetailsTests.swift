//
//  UpcomingEventsLeagueDetailsTests.swift
//  SportifyTests
//
//  Created by Ahmd Amr on 02/05/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import XCTest
@testable import Sportify

class UpcomingEventsLeagueDetailsTests: XCTestCase {

    
    var realSportsAPI: UpcomingEventManagerProtocol!
    var mockUpcomingLDAPI: MockUpcomingEventsLeagueDetailsAPI!
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        realSportsAPI = SportsAPI.shared
        mockUpcomingLDAPI = MockUpcomingEventsLeagueDetailsAPI(shouldReturnError: false)
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        realSportsAPI = nil
        mockUpcomingLDAPI = nil
    }
    
    //                              Real API
    func testGetUpcomingLeagueDetails(){
        let expext = expectation(description: "upcoming")
        
        realSportsAPI.getUpcomingEvents(leagueId: "4328", round: "33") { (res) in
            switch res {
            case .success(let response):
                expext.fulfill()
                XCTAssertEqual(response?.events?.count, 10)
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
    }

    func testGetUpcomingFail(){
           let expect = expectation(description: "teams")
           
        realSportsAPI.getUpcomingEvents(leagueId: "4328", round: "", completion: { (res) in
            switch res {
            case .success(_):
                XCTFail()
            case .failure(let err):
                expect.fulfill()
                XCTAssertNotNil(err)
            }
        })
           waitForExpectations(timeout: 7)
       }
    
    //                              Mock API
    func testMockGetUpcoming(){
        mockUpcomingLDAPI.getUpcomingEvents(leagueId: "", round: "") { (res) in
            switch res {
            case .success(let response):
                XCTAssertNotEqual(response?.events?.count, 0)
            case .failure(_):
                XCTFail()
            }
        }
    }
    
   
}
