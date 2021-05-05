//
//  AllsportsUITests.swift
//  SportifyUITests
//
//  Created by Amr Muhammad on 5/1/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import XCTest

class AllsportsUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAllsportsNavigation(){
        let app = XCUIApplication()
        
        app.navigationBars["Sportify"].staticTexts["Sportify"].tap()
        app.collectionViews.cells.otherElements.containing(.staticText, identifier:"Soccer").element.tap()
        let navigate = app.navigationBars["Soccer Leagues"].staticTexts["Soccer Leagues"]
        if(!navigate.exists){
            XCTFail()
        }
    }
    
    func testAllsportsNoConnection(){
        let app = XCUIApplication()
        let alert = app.alerts["Error"]
        if(alert.exists){
            XCTFail()
        }
    }

}
