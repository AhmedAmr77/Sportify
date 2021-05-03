//
//  MockTeamsLeagueDetailsAPI.swift
//  SportifyTests
//
//  Created by Ahmd Amr on 02/05/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
@testable import Sportify

class MockTeamsLeagueDetailsAPI {
    
    var shouldReturnError: Bool!
    
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    let mockTeamsJSONResponse: [String: [[String: Any?]]] = [
    "teams":[
        [
        "idTeam":"133604",
        "idSoccerXML":"9",
        "idAPIfootball":"42",
        "intLoved":"4",
        "strTeam":"Arsenal",
        "strTeamShort":"ARS",
        "strAlternate":"Arsenal Football Club",
        "intFormedYear":"1892",
        "strSport":"Soccer",
        "strLeague":"English Premier League",
        "idLeague":"4328",
        "strLeague2":"UEFA Europa League",
        "idLeague2":"4481",
        "strLeague3":"FA Cup",
        "idLeague3":"4482",
        "strLeague4":"EFL Cup",
        "idLeague4":"4570",
        "strLeague5":"FA Community Shield",
        "idLeague5":"4571",
        "strLeague6":"",
        "idLeague6":nil,
        "strLeague7":"",
        "idLeague7":nil,
        "strDivision":nil,
        "strManager":"",
        "strStadium":"Emirates Stadium",
        "strKeywords":"Gunners, Gooners",
        "strRSS":"https://www.allarsenal.com/feed/",
        "strStadiumThumb":"https://www.thesportsdb.com/images/media/team/stadium/w1anwa1588432105.jpg",
        "strStadiumDescription":"",
        "strStadiumLocation":"Holloway, London",
        "intStadiumCapacity":"60338",
        "strWebsite":"www.arsenal.com",
        "strFacebook":"www.facebook.com/Arsenal",
        "strTwitter":"twitter.com/arsenal",
        "strInstagram":"instagram.com/arsenal",
        "strDescriptionEN":"",
        "strDescriptionDE":"",
        "strDescriptionFR":"",
        "strDescriptionCN":nil,
        "strDescriptionIT":"",
        "strDescriptionJP":"",
        "strDescriptionRU":"",
        "strDescriptionES":"",
        "strDescriptionPT":"",
        "strDescriptionSE":nil,
        "strDescriptionNL":nil,
        "strDescriptionHU":nil,
        "strDescriptionNO":"",
        "strDescriptionIL":nil,
        "strDescriptionPL":nil,
        "strGender":"Male",
        "strCountry":"England",
        "strTeamBadge":"https://www.thesportsdb.com/images/media/team/badge/uyhbfe1612467038.png",
        "strTeamJersey":"https://www.thesportsdb.com/images/media/team/jersey/mpintc1586884343.png",
        "strTeamLogo":"https://www.thesportsdb.com/images/media/team/logo/q2mxlz1512644512.png",
        "strTeamFanart1":"https://www.thesportsdb.com/images/media/team/fanart/xyusxr1419347566.jpg",
        "strTeamFanart2":"https://www.thesportsdb.com/images/media/team/fanart/qttspr1419347612.jpg",
        "strTeamFanart3":"https://www.thesportsdb.com/images/media/team/fanart/uwssqx1420884450.jpg",
        "strTeamFanart4":"https://www.thesportsdb.com/images/media/team/fanart/qtprsw1420884964.jpg",
        "strTeamBanner":"https://www.thesportsdb.com/images/media/team/banner/rtpsrr1419351049.jpg",
        "strYoutube":"www.youtube.com/user/ArsenalTour",
        "strLocked":"unlocked"
        ],
        [
        "idTeam":"133601",
        "idSoccerXML":"5",
        "idAPIfootball":"66",
        "intLoved":nil,
        "strTeam":"Aston Villa",
        "strTeamShort":"AVL",
        "strAlternate":"Aston Villa FC",
        "intFormedYear":"1874",
        "strSport":"Soccer",
        "strLeague":"English Premier League",
        "idLeague":"4328",
        "strLeague2":"FA Cup",
        "idLeague2":"4482",
        "strLeague3":"EFL Cup",
        "idLeague3":"4570",
        "strLeague4":"",
        "idLeague4":nil,
        "strLeague5":"",
        "idLeague5":nil,
        "strLeague6":nil,
        "idLeague6":nil,
        "strLeague7":nil,
        "idLeague7":nil,
        "strDivision":nil,
        "strManager":"",
        "strStadium":"Villa Park",
        "strKeywords":"Villa, The Villa, The Villans and The Lions",
        "strRSS":"http://www.football365.com/aston-villa/rss",
        "strStadiumThumb":"https://www.thesportsdb.com/images/media/team/stadium/uwyqtq1420238705.jpg",
        "strStadiumDescription":"",
        "strStadiumLocation":"Aston, Birmingham",
        "intStadiumCapacity":"42785",
        "strWebsite":"www.avfc.co.uk",
        "strFacebook":"www.facebook.com/avfcofficial",
        "strTwitter":"twitter.com/avfcofficial",
        "strInstagram":"instagram.com/avfcofficial",
        "strDescriptionEN":"",
        "strDescriptionDE":nil,
        "strDescriptionFR":nil,
        "strDescriptionCN":nil,
        "strDescriptionIT":nil,
        "strDescriptionJP":nil,
        "strDescriptionRU":nil,
        "strDescriptionES":nil,
        "strDescriptionPT":nil,
        "strDescriptionSE":nil,
        "strDescriptionNL":nil,
        "strDescriptionHU":nil,
        "strDescriptionNO":nil,
        "strDescriptionIL":nil,
        "strDescriptionPL":nil,
        "strGender":"Male",
        "strCountry":"England",
        "strTeamBadge":"https://www.thesportsdb.com/images/media/team/badge/aofmzk1565427581.png",
        "strTeamJersey":"https://www.thesportsdb.com/images/media/team/jersey/fmwt4p1599922694.png",
        "strTeamLogo":"https://www.thesportsdb.com/images/media/team/logo/wtsxus1424375522.png",
        "strTeamFanart1":"https://www.thesportsdb.com/images/media/team/fanart/trxryx1421747670.jpg",
        "strTeamFanart2":"https://www.thesportsdb.com/images/media/team/fanart/ywquwr1421747828.jpg",
        "strTeamFanart3":"https://www.thesportsdb.com/images/media/team/fanart/cal7fg1485707947.jpg",
        "strTeamFanart4":"https://www.thesportsdb.com/images/media/team/fanart/qvpvwq1421747716.jpg",
        "strTeamBanner":"https://www.thesportsdb.com/images/media/team/banner/vrttsr1421749709.jpg",
        "strYoutube":"www.youtube.com/user/avfcofficial",
        "strLocked":"unlocked"
        ]
    ]]
}

enum ResponseError: Error {
    case responseWaitError
}

extension MockTeamsLeagueDetailsAPI: TeamsManagerProtocol{
    func getTeams(leagueId: String, completion: @escaping (Result<TeamsJSON?, NSError>) -> Void) {
        var teamsJSON = TeamsJSON(teams: [Team]())
        
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: mockTeamsJSONResponse, options: .fragmentsAllowed)
            teamsJSON = try JSONDecoder().decode(TeamsJSON.self, from: jsonData)

        }catch let error{
            print(error.localizedDescription)
        }
        
        if shouldReturnError {
            completion(.failure(ResponseError.responseWaitError as NSError))
        } else {
            completion(.success(teamsJSON))
        }
    }
}
