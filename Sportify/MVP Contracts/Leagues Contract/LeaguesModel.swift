//
//  LeaguesModel.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/24/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
// MARK: - Leagues
struct Leagues: Codable {
    let countrys: [Country]
}

// MARK: - Country
struct Country: Codable {
    let idLeague: String?
    let idAPIfootball, strSport, strLeague, strLeagueAlternate: String?
    let strDivision, idCup, strCurrentSeason, intFormedYear: String?
    let dateFirstEvent, strGender, strCountry, strWebsite: String?
    let strFacebook, strTwitter, strYoutube, strRSS: String?
    let strDescriptionEN: String?
    let strBadge: String?
    let strNaming: String?
    let strLocked: String?
}
