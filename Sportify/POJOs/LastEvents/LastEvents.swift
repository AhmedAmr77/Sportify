//
//  LastEvents.swift
//  Sportify
//
//  Created by Ahmd Amr on 25/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

struct LastEventsJSON: Codable {
    let events: [LastEvents]?
}

struct LastEvents: Codable {
    let strHomeTeam: String?
    let strAwayTeam: String?
    let intHomeScore: String?
    let intAwayScore: String?
    let strStatus: String?  //if match NOT played
    let dateEvent: String?
    let intRound: String?
    
}

//struct LastEventsWithTeams {
//    let events: [LastEvents]?
//    let teams: [Team]?
//}

/*
 "events":[
 {
    "idEvent":"1036599",
    "idSoccerXML":null,
    "idAPIfootball":"592824",
    "strEvent":"West Ham vs Chelsea",
    "strEventAlternate":"Chelsea @ West Ham",
    "strFilename":"English Premier League 2021-04-24 West Ham vs Chelsea",
    "strSport":"Soccer",
    "idLeague":"4328",
    "strLeague":"English Premier League",
    "strSeason":"2020-2021",
    "strDescriptionEN":"",
    "strHomeTeam":"West Ham",
    "strAwayTeam":"Chelsea",
    "intHomeScore":"0",
    "intRound":"33",
    "intAwayScore":"1",
    "intSpectators":null,
    "strOfficial":"",
    "strHomeGoalDetails":"",
    "strHomeRedCards":null,
    "strHomeYellowCards":null,
    "strHomeLineupGoalkeeper":null,
    "strHomeLineupDefense":null,
    "strHomeLineupMidfield":null,
    "strHomeLineupForward":null,
    "strHomeLineupSubstitutes":null,
    "strHomeFormation":null,
    "strAwayRedCards":null,
    "strAwayYellowCards":null,
    "strAwayGoalDetails":"",
    "strAwayLineupGoalkeeper":null,
    "strAwayLineupDefense":null,
    "strAwayLineupMidfield":null,
    "strAwayLineupForward":null,
    "strAwayLineupSubstitutes":null,
    "strAwayFormation":null,
    "intHomeShots":null,
    "intAwayShots":null,
    "strTimestamp":"2021-04-24T16:30:00+00:00",
    "dateEvent":"2021-04-24",
    "dateEventLocal":"2021-04-24",
    "strTime":"16:30:00",
    "strTimeLocal":"17:30:00",
    "strTVStation":null,
    "idHomeTeam":"133636",
    "idAwayTeam":"133610",
    "strResult":"",
    "strVenue":"London Stadium",
    "strCountry":"England",
    "strCity":"",
    "strPoster":null,
    "strSquare":null,
    "strFanart":null,
    "strThumb":"https:\/\/www.thesportsdb.com\/images\/media\/event\/thumb\/594g581603530684.jpg",
    "strBanner":null,
    "strMap":null,
    "strTweet1":"",
    "strTweet2":"",
    "strTweet3":"",
    "strVideo":"",
    "strStatus":"Match Finished",
    "strPostponed":"no",
    "strLocked":"unlocked"
 },
 {
    "idEvent":"1036598",
    "idSoccerXML":null,
    "
 */
