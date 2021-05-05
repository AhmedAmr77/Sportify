//
//  MockLastEventsLeagueDetailsAPI.swift
//  SportifyTests
//
//  Created by Ahmd Amr on 02/05/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
@testable import Sportify

class MockLastEventsLeagueDetailsAPI {
    
    var shouldReturnError: Bool!
    
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    let mockLastJSONResponse: [String: [[String: Any?]]] =

    [
        "events":[
            [
                "idEvent":"1036609",
                "idSoccerXML":nil,
                "idAPIfootball":"592834",
                "strEvent":"Tottenham vs Sheffield United",
                "strEventAlternate":"Sheffield United @ Tottenham",
                "strFilename":"English Premier League 2021-05-02 Tottenham vs Sheffield United",
                "strSport":"Soccer",
                "idLeague":"4328",
                "strLeague":"English Premier League",
                "strSeason":"2020-2021",
                "strDescriptionEN":"Having lost the EFL Cup final, Tottenham Hotspur resumes its league campaign with a game against already relegated Sheffield United. The Blades’ last trip to Tottenham back in 2019, was embroiled by a controversial VAR decision.",
                "strHomeTeam":"Tottenham",
                "strAwayTeam":"Sheffield United",
                "intHomeScore":"4",
                "intRound":"34",
                "intAwayScore":"0",
                "intSpectators":nil,
                "strOfficial":"",
                "strHomeGoalDetails":"",
                "strHomeRedCards":nil,
                "strHomeYellowCards":nil,
                "strHomeLineupGoalkeeper":nil,
                "strHomeLineupDefense":nil,
                "strHomeLineupMidfield":nil,
                "strHomeLineupForward":nil,
                "strHomeLineupSubstitutes":nil,
                "strHomeFormation":nil,
                "strAwayRedCards":nil,
                "strAwayYellowCards":nil,
                "strAwayGoalDetails":"",
                "strAwayLineupGoalkeeper":nil,
                "strAwayLineupDefense":nil,
                "strAwayLineupMidfield":nil,
                "strAwayLineupForward":nil,
                "strAwayLineupSubstitutes":nil,
                "strAwayFormation":nil,
                "intHomeShots":nil,
                "intAwayShots":nil,
                "strTimestamp":"2021-05-02T18:15:00+00:00",
                "dateEvent":"2021-05-02",
                "dateEventLocal":"2021-05-02",
                "strTime":"18:15:00",
                "strTimeLocal":"19:15:00",
                "strTVStation":nil,
                "idHomeTeam":"133616",
                "idAwayTeam":"133811",
                "strResult":"",
                "strVenue":"Tottenham Hotspur Stadium",
                "strCountry":"England",
                "strCity":"",
                "strPoster":nil,
                "strSquare":nil,
                "strFanart":nil,
                "strThumb":"https://www.thesportsdb.com/images/media/event/thumb/94gct11603530689.jpg",
                "strBanner":nil,
                "strMap":nil,
                "strTweet1":"",
                "strTweet2":"",
                "strTweet3":"",
                "strVideo":"",
                "strStatus":"Match Finished",
                "strPostponed":"no",
                "strLocked":"unlocked"
            ],
            [
                "idEvent":"1036607",
                "idSoccerXML":nil,
                "idAPIfootball":"592832",
                "strEvent":"Newcastle vs Arsenal",
                "strEventAlternate":"Arsenal @ Newcastle",
                "strFilename":"English Premier League 2021-05-02 Newcastle vs Arsenal",
                "strSport":"Soccer",
                "idLeague":"4328",
                "strLeague":"English Premier League",
                "strSeason":"2020-2021",
                "strDescriptionEN":"Newcastle United hopes to stay away from the relegation zone when it hosts Arsenal. The Magpies are currently unbeaten in their last five matches at St. James’ Park, but face an Arsenal team looking to secure a European place.",
                "strHomeTeam":"Newcastle",
                "strAwayTeam":"Arsenal",
                "intHomeScore":"0",
                "intRound":"34",
                "intAwayScore":"2",
                "intSpectators":nil,
                "strOfficial":"",
                "strHomeGoalDetails":"",
                "strHomeRedCards":nil,
                "strHomeYellowCards":nil,
                "strHomeLineupGoalkeeper":nil,
                "strHomeLineupDefense":nil,
                "strHomeLineupMidfield":nil,
                "strHomeLineupForward":nil,
                "strHomeLineupSubstitutes":nil,
                "strHomeFormation":nil,
                "strAwayRedCards":nil,
                "strAwayYellowCards":nil,
                "strAwayGoalDetails":"",
                "strAwayLineupGoalkeeper":nil,
                "strAwayLineupDefense":nil,
                "strAwayLineupMidfield":nil,
                "strAwayLineupForward":nil,
                "strAwayLineupSubstitutes":nil,
                "strAwayFormation":nil,
                "intHomeShots":nil,
                "intAwayShots":nil,
                "strTimestamp":"2021-05-02T13:00:00+00:00",
                "dateEvent":"2021-05-02",
                "dateEventLocal":"2021-05-02",
                "strTime":"13:00:00",
                "strTimeLocal":"14:00:00",
                "strTVStation":nil,
                "idHomeTeam":"134777",
                "idAwayTeam":"133604",
                "strResult":"",
                "strVenue":"St. James' Park",
                "strCountry":"England",
                "strCity":"",
                "strPoster":nil,
                "strSquare":nil,
                "strFanart":nil,
                "strThumb":"https://www.thesportsdb.com/images/media/event/thumb/4v4qay1603530688.jpg",
                "strBanner":nil,
                "strMap":nil,
                "strTweet1":"",
                "strTweet2":"",
                "strTweet3":"",
                "strVideo":"",
                "strStatus":"Match Finished",
                "strPostponed":"no",
                "strLocked":"unlocked"
            ]
        ]]
}

extension MockLastEventsLeagueDetailsAPI: LastEventManagerProtocol {
    func getLastEvents(leagueId: String, completion: @escaping (Result<LastEventsJSON?, NSError>) -> Void) {
         var lastJSON = LastEventsJSON(events: [LastEvents]())
               
               do{
                   let jsonData = try JSONSerialization.data(withJSONObject: mockLastJSONResponse, options: .fragmentsAllowed)
                   lastJSON = try JSONDecoder().decode(LastEventsJSON.self, from: jsonData)
                   
               }catch let error{
                   print(error.localizedDescription)
               }
               
               if shouldReturnError {
                   completion(.failure(ResponseError.responseWaitError as NSError))
               } else {
                   completion(.success(lastJSON))
               }
           }
    
    
}
