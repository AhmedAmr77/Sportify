//
//  LeagueDetailsUITests.swift
//  SportifyUITests
//
//  Created by Ahmd Amr on 03/05/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import XCTest

class LeagueDetailsUITests: XCTestCase {

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

    func testLeagueDetailsBackNavigation(){
        
//        let app = XCUIApplication()
//        app.navigationBars["Albanian Kategoria e Parë"].buttons["Soccer Leagues"].tap()
//        app.tables/*@START_MENU_TOKEN@*/.cells.staticTexts["Andorran 1a Divisió"]/*[[".cells.staticTexts[\"Andorran 1a Divisió\"]",".staticTexts[\"Andorran 1a Divisió\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
//
           
//        let snapshot = try? app.snapshot()
        
//        let andorranSegonaDivisiNavigationBar = app.navigationBars["Andorran Segona Divisió"]
//        andorranSegonaDivisiNavigationBar.staticTexts["Andorran Segona Divisió"].tap()
//        andorranSegonaDivisiNavigationBar.buttons["Soccer Leagues"].tap()
        
        
        
        let favoriteButton = XCUIApplication().navigationBars["Algerian Ligue 1"].buttons["favorite"]
        if favoriteButton.exists {
            XCTFail()
        }
                        
                        
    }
    
    
    func testLeagueDetailsAddToFavorite(){
        
        let app = XCUIApplication()
        
//        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Albanian Superliga"]/*[[".cells.staticTexts[\"Albanian Superliga\"]",".staticTexts[\"Albanian Superliga\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    
//        app.navigationBars["Andorran 1a Divisió"].buttons["favorite"].tap()
        
        
        let tablesQuery = XCUIApplication().tables
        let jungleFightMensStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Jungle Fight Mens"]/*[[".cells.staticTexts[\"Jungle Fight Mens\"]",".staticTexts[\"Jungle Fight Mens\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        if jungleFightMensStaticText.exists {
            XCTFail()
        }
        
//        let teamsStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["TEAMS"]/*[[".cells.staticTexts[\"TEAMS\"]",".staticTexts[\"TEAMS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        teamsStaticText.tap()
//        jungleFightMensStaticText.tap()
//        jungleFightMensStaticText.tap()
//        jungleFightMensStaticText.tap()
//        teamsStaticText.tap()
//        jungleFightMensStaticText.tap()
//        jungleFightMensStaticText.tap()
//
//        app.cells.element(boundBy: 1).tap()
    }
    
    func testLeagueDetailsNavigateToTeam() {
        
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["LAST EVENTS"]/*[[".cells.staticTexts[\"LAST EVENTS\"]",".staticTexts[\"LAST EVENTS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        XCUIApplication().navigationBars["Team Details"].buttons["Andorran Segona Divisió"].tap()
                
        XCUIApplication().collectionViews/*@START_MENU_TOKEN@*/.staticTexts["Soccer"]/*[[".cells.staticTexts[\"Soccer\"]",".staticTexts[\"Soccer\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let lastEventsStaticText = XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["LAST EVENTS"]/*[[".cells.staticTexts[\"LAST EVENTS\"]",".staticTexts[\"LAST EVENTS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        lastEventsStaticText.swipeUp()
        lastEventsStaticText.swipeUp()
                        
    }
    
    func testtestt(){
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.staticTexts["LAST EVENTS"]/*[[".cells.staticTexts[\"LAST EVENTS\"]",".staticTexts[\"LAST EVENTS\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        XCUIApplication().navigationBars["Team Details"].buttons["Australian A-League"].tap()
                
    }
}
