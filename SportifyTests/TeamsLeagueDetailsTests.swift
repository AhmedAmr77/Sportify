//
//  TeamsLeagueDetailsTests.swift
//  SportifyTests
//
//  Created by Ahmd Amr on 02/05/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import XCTest
@testable import Sportify

class TeamsLeagueDetailsTests: XCTestCase {

    
    var realSportsAPI: TeamsManagerProtocol!
    var mockTeamsLDAPI: MockTeamsLeagueDetailsAPI!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        realSportsAPI = SportsAPI.shared
        mockTeamsLDAPI = MockTeamsLeagueDetailsAPI(shouldReturnError: false)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        realSportsAPI = nil
        mockTeamsLDAPI = nil
    }
    
    //                              Real API
    func testGetTeamsSuccess(){
        let expect = expectation(description: "teams")
        
        realSportsAPI.getTeams(leagueId: "4328") { (res) in
            switch res {
            case .success(let response):
                expect.fulfill()
                XCTAssertEqual(response?.teams?[0].strTeam, "Arsenal")
                XCTAssertEqual(response?.teams?.count, 20)
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testGetTeamsFail(){
        let expect = expectation(description: "teams")
        
        realSportsAPI.getTeams(leagueId: "") { (res) in
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
    func testMockGetTeams(){
        mockTeamsLDAPI.getTeams(leagueId: "", completion: { (res) in
            switch res {
            case .success(let response):
                XCTAssertEqual(response?.teams?[0].strTeam, "Arsenal")
                XCTAssertEqual(response?.teams?.count, 2)
            case .failure(_):
                XCTFail()
            }
        })
    }
    

}
