//
//  AllLeaguesTests.swift
//  SportifyTests
//
//  Created by Amr Muhammad on 5/2/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import XCTest
@testable import Sportify

class AllLeaguesTests: XCTestCase {

    var realLeaguesAPI:IAllLeaguesManager!
    var mockLeaguesAPI:MockAllLeaguesAPI!
    
    override func setUpWithError() throws {
        realLeaguesAPI = SportsAPI.shared
        mockLeaguesAPI = MockAllLeaguesAPI(shouldReturnError: false)
    }

    override func tearDownWithError() throws {
        realLeaguesAPI = nil
        mockLeaguesAPI = nil
    }
    
    func testAllLeagues(){
        let expect = expectation(description: "all leagues")
        realLeaguesAPI.getLeagues(sport: "soccer") { (result) in
            switch result{
            case .success(let leagues):
                expect.fulfill()
                XCTAssertEqual(leagues?.countrys.count, 50)
            case .failure(_):
                XCTFail()
            }
        }
        waitForExpectations(timeout: 5)
    }
    
    func testMockAllLeagues(){
        mockLeaguesAPI.getLeagues(sport: "soccer", completion: { (result) in
            switch result{
            case .success(let leagues):
                XCTAssertEqual(leagues?.countrys.count, 2)
            case .failure(_):
                XCTFail()
            }
        })
    }

}
