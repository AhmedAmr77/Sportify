//
//  MockAllLeaguesAPI.swift
//  SportifyTests
//
//  Created by Amr Muhammad on 5/2/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
@testable import Sportify

class MockAllLeaguesAPI{
    var shouldReturnError:Bool
    
    init(shouldReturnError:Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    var error:Error!
    
    var allLeaguesJSONResponse : [String:[[String:Any?]]] = ["countrys":[["idLeague":"4617","idSoccerXML":nil,"idAPIfootball":"2825","strSport":"Soccer","strLeague":"Albanian Superliga","strLeagueAlternate":"Superliga","strDivision":"1","idCup":"0","strCurrentSeason":"2020-2021","intFormedYear":"1910","dateFirstEvent":"2019-08-23","strGender":"Male","strCountry":"Albania","strWebsite":"fshf.org/competition/superiore-1718","strFacebook":"","strTwitter":"","strYoutube":"","strRSS":"","strDescriptionEN":"The Albanian Superliga (Albanian: Kategoria Superiore) is a professional league for men's association football clubs. At the top of the Albanian football league system, it is the country's primary football competition. It is contested by 10 clubs, and operates on a system of promotion and relegation with the Albanian First Division. Seasons run from August to May, with teams playing 36 matches each (playing each team in the league four times, twice at home and twice away).rnrnThe competition was founded in 1930 as the Albanian National Championship during the reign of King Zog, shortly after the creation of the Albanian Football Association. Since 1930, 43 clubs have competed in recognized competitions, while only nine clubs have won the title: KF Tirana (24), Dinamo Tirana (18), FK Partizani (16), Vllaznia (9), Skënderbeu (8), KF Elbasani (2), Flamurtari (1), Teuta (1) and FK Kukësi (1). The current champions are FK Partizani, who won their 16th title in 2018–19.","strDescriptionDE":nil,"strDescriptionFR":nil,"strDescriptionIT":nil,"strDescriptionCN":nil,"strDescriptionJP":nil,"strDescriptionRU":nil,"strDescriptionES":nil,"strDescriptionPT":nil,"strDescriptionSE":nil,"strDescriptionNL":nil,"strDescriptionHU":nil,"strDescriptionNO":nil,"strDescriptionPL":nil,"strDescriptionIL":nil,"strFanart1":nil,"strFanart2":nil,"strFanart3":nil,"strFanart4":nil,"strBanner":nil,"strBadge":"https://www.thesportsdb.com/images/media/league/badge/6my1u31578828133.png","strLogo":nil,"strPoster":nil,"strTrophy":nil,"strNaming":"{strHomeTeam} vs {strAwayTeam}","strComplete":nil,"strLocked":"unlocked"],["idLeague":"4907","idSoccerXML":nil,"idAPIfootball":"3032","strSport":"Soccer","strLeague":"Albanian Kategoria e Parë","strLeagueAlternate":"Albanian Second Division","strDivision":"2","idCup":"0","strCurrentSeason":"2020-2021","intFormedYear":"1930","dateFirstEvent":"2020-11-04","strGender":"Male","strCountry":"Albania","strWebsite":"fshf.org/competition/kategoria-e-pare","strFacebook":"www.facebook.com/FederataShqiptareeFutbollit","strTwitter":"twitter.com/FSHForg","strYoutube":"www.youtube.com/channel/UC3Guly6AbOr3PqrZMaV6vog","strRSS":"","strDescriptionEN":"Kategoria e Parë is the second level of professional football in Albania, behind the Kategoria Superiore and above the Kategoria e Dytë.rnrnunded in 1930. It is made up of 2 groups, each containing 9 teams. The group winners gain promotion to the Kategoria Superiore and play a final against each other, while the teams that finish in the second place, play a play-off match against each other. The winner qualifies to the final play-off match, against the 8th ranked team of the Kategoria Superiore. The teams that finish in the 8th and last place get relegated to the Kategoria e Dytë. The 7th ranked teams, qualify to the relegation play-off round.","strDescriptionDE":nil,"strDescriptionFR":nil,"strDescriptionIT":nil,"strDescriptionCN":nil,"strDescriptionJP":nil,"strDescriptionRU":nil,"strDescriptionES":nil,"strDescriptionPT":nil,"strDescriptionSE":nil,"strDescriptionNL":nil,"strDescriptionHU":nil,"strDescriptionNO":nil,"strDescriptionPL":nil,"strDescriptionIL":nil,"strFanart1":nil,"strFanart2":nil,"strFanart3":nil,"strFanart4":nil,"strBanner":nil,"strBadge":"https://www.thesportsdb.com/images/media/league/badge/u09z9l1614341476.png","strLogo":"https://www.thesportsdb.com/images/media/league/logo/8i0j4u1614341476.png","strPoster":nil,"strTrophy":nil,"strNaming":"{strHomeTeam} vs {strAwayTeam}","strComplete":"no","strLocked":"unlocked"]]]
    
    enum ErrorHandler : Error {
        case returnError
    }
}


extension MockAllLeaguesAPI : IAllLeaguesManager {
    func getLeagues(sport: String, completion: @escaping (Result<Leagues?, NSError>) -> Void) {
        var allLeaguesModel = Leagues(countrys: [])
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: allLeaguesJSONResponse, options: .fragmentsAllowed)
            allLeaguesModel = try JSONDecoder().decode(Leagues.self, from: jsonData)

        }catch let error{
            print(error.localizedDescription)
        }
        
        if shouldReturnError{
            completion(.failure(error! as NSError))
        }else{
            completion(.success(allLeaguesModel))
        }
    }
}

