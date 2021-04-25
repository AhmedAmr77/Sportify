//
//  UpcomingEvents.swift
//  Sportify
//
//  Created by Ahmd Amr on 25/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

struct UpcomingEventsJSON: Codable {
    let events: [UpcomingEvents]?
}

struct UpcomingEvents: Codable {
    let idEvent: String?
    let strHomeTeam: String?
    let strAwayTeam: String?
    let strTime: String?
    let dateEvent: String?
    
}

/*
 events":[
 {
    "idEvent":"1036631",
    "idSoccerXML":null,
    "idAPIfootball":"592856",
    "strEvent":"Brighton vs Man City",
    "strEventAlternate":"Man City @ Brighton",
    "strFilename":"English Premier League 2021-05-15 Brighton vs Man City",
    "strSport":"Soccer",
    "idLeague":"4328",
    "strLeague":"English Premier League",
    "strSeason":"2020-2021",
    "strDescriptionEN":"",
    "strHomeTeam":"Brighton",
    "strAwayTeam":"Man City",
    "intHomeScore":null,
    "intRound":"37",
    "intAwayScore":null,
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
    "strTimestamp":"2021-05-15T14:00:00+00:00",
    "dateEvent":"2021-05-15",
    "dateEventLocal":"2021-05-15",
    "strTime":"14:00:00",
    "strTimeLocal":"15:00:00",
    "strTVStation":null,
    "idHomeTeam":"133619",
    "idAwayTeam":"133613",
    "strResult":"",
    "strVenue":"The American Express Community Stadium",
    "strCountry":"England",
    "strCity":"",
    "strPoster":null,
    "strSquare":null,
    "strFanart":null,
    "strThumb":"https:\/\/www.thesportsdb.com\/images\/media\/event\/thumb\/l0j5oy1603530700.jpg",
    "strBanner":null,
    "strMap":null,
    "strTweet1":"",
    "strTweet2":"",
    "strTweet3":"",
    "strVideo":"",
    "strStatus":"Not Started",
    "strPostponed":"no",
    "strLocked":"unlocked"
 },
 {
    "idEvent":"1036632",
    "idSoccerXML":null,
    "idAPIfootball
 */
