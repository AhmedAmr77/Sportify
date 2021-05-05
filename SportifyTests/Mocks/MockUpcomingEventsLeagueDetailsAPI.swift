//
//  MockUpcomingEventsLeagueDetailsAPI.swift
//  SportifyTests
//
//  Created by Ahmd Amr on 02/05/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
@testable import Sportify

class MockUpcomingEventsLeagueDetailsAPI {
    
    var shouldReturnError: Bool!
    
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    let mockUpcomingJSONResponse: [String: [[String: Any?]]] =
        [
        "events":[
        [
        "idEvent":"1036593",
        "idSoccerXML":nil,
        "idAPIfootball":"592818",
        "strEvent":"Fulham vs Tottenham",
        "strEventAlternate":"Tottenham @ Fulham",
        "strFilename":"English Premier League 2021-03-04 Fulham vs Tottenham",
        "strSport":"Soccer",
        "idLeague":"4328",
        "strLeague":"English Premier League",
        "strSeason":"2020-2021",
        "strDescriptionEN":"",
        "strHomeTeam":"Fulham",
        "strAwayTeam":"Tottenham",
        "intHomeScore":"0",
        "intRound":"33",
        "intAwayScore":"1",
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
        "strTimestamp":"2021-03-04T18:00:00+00:00",
        "dateEvent":"2021-03-04",
        "dateEventLocal":"2021-03-04",
        "strTime":"18:00:00",
        "strTimeLocal":"18:00:00",
        "strTVStation":nil,
        "idHomeTeam":"133600",
        "idAwayTeam":"133616",
        "strResult":"",
        "strVenue":"Craven Cottage",
        "strCountry":"England",
        "strCity":"",
        "strPoster":nil,
        "strSquare":nil,
        "strFanart":nil,
        "strThumb":"https://www.thesportsdb.com/images/media/event/thumb/2l0jze1603530682.jpg",
        "strBanner":nil,
        "strMap":nil,
        "strTweet1":"",
        "strTweet2":"",
        "strTweet3":"",
        "strVideo":"https://www.youtube.com/watch?v=JCbyaUw7w5I",
        "strStatus":"Match Finished",
        "strPostponed":"no",
        "strLocked":"unlocked"
        ],
        [
        "idEvent":"1036597",
        "idSoccerXML":nil,
        "idAPIfootball":"592822",
        "strEvent":"Man City vs Southampton",
        "strEventAlternate":"Southampton @ Man City",
        "strFilename":"English Premier League 2021-03-10 Man City vs Southampton",
        "strSport":"Soccer",
        "idLeague":"4328",
        "strLeague":"English Premier League",
        "strSeason":"2020-2021",
        "strDescriptionEN":"Two teams at opposite ends of the Premier League form table meet as Manchester City hosts Southampton. The host has built a near-unassailable lead atop the table, while Southamptons form has crumbled since a 9-0 loss at Old Trafford in February.",
        "strHomeTeam":"Man City",
        "strAwayTeam":"Southampton",
        "intHomeScore":"5",
        "intRound":"33",
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
        "strTimestamp":"2021-03-10T18:00:00+00:00",
        "dateEvent":"2021-03-10",
        "dateEventLocal":"2021-03-10",
        "strTime":"18:00:00",
        "strTimeLocal":"18:00:00",
        "strTVStation":nil,
        "idHomeTeam":"133613",
        "idAwayTeam":"134778",
        "strResult":"",
        "strVenue":"Etihad Stadium",
        "strCountry":"England",
        "strCity":"",
        "strPoster":nil,
        "strSquare":nil,
        "strFanart":nil,
        "strThumb":"https://www.thesportsdb.com/images/media/event/thumb/sto6we1603530683.jpg",
        "strBanner":nil,
        "strMap":nil,
        "strTweet1":"",
        "strTweet2":"",
        "strTweet3":"",
        "strVideo":"https://www.youtube.com/watch?v=hvTT_4ecK0k",
        "strStatus":"Match Finished",
        "strPostponed":"no",
        "strLocked":"unlocked"
        ]
            ]]
            
}

extension MockUpcomingEventsLeagueDetailsAPI: UpcomingEventManagerProtocol{
    func getUpcomingEvents(leagueId: String, round: String, completion: @escaping (Result<UpcomingEventsJSON?, NSError>) -> Void) {
        var upcomingJSON = UpcomingEventsJSON(events: [UpcomingEvents]())
        
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: mockUpcomingJSONResponse, options: .fragmentsAllowed)
            upcomingJSON = try JSONDecoder().decode(UpcomingEventsJSON.self, from: jsonData)
            
        }catch let error{
            print(error.localizedDescription)
        }
        
        if shouldReturnError {
            completion(.failure(ResponseError.responseWaitError as NSError))
        } else {
            completion(.success(upcomingJSON))
        }
    }
}
