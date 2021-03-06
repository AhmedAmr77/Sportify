//
//  Constants.swift
//  Sportify
//
//  Created by Ahmd Amr on 21/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

struct Constants {
    
    
    
    
    
    // MARK: Amr Section
    static let allSportsCellIdentifier = "AllSportsCollectionViewCell"
    static let allSportsURL = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
    
    static let leaguesViewControllerIdentifier = "LeaguesTableViewController"
    static let LeaguesCellIdentifier = "LeaguesTableViewCell"
    static let allLeaguesURL = "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s="

    static let webViewViewController = "WebViewViewController"
    
    static let teamDetailsUrl = "https://www.thesportsdb.com/api/v1/json/1/lookupteam.php?id="
    static let teamDetailsViewController = "TeamDetailsTableViewController"
    
    static let leagueDetailsViewController = "LeagueDetailsViewController"
    
    static let baseURL = "https://www.thesportsdb.com/api/v1/json/1/"
    static let getAllSports = "all_sports.php"
    static let getAllLeagues = "search_all_leagues.php"
    static let getLeagueDetails = ""
    static let getTeamDetails = "lookupteam.php"
    
    static let genericError = "error in networkLayer"

    
    
    // MARK: Ahmd Section
    
    static let getTeams = "lookup_all_teams.php"
    static let getLastEvents = "eventspastleague.php"
    static let getUpcomingEvent = "eventsround.php"
    
    static let teamsJsonURL = "https://www.thesportsdb.com/api/v1/json/1/lookup_all_teams.php?id="
    static let lastEventJsonURL = "https://www.thesportsdb.com/api/v1/json/1/eventspastleague.php?id="
    static let upcomingEventJsonURL = "https://www.thesportsdb.com/api/v1/json/1/eventsround.php?id=&r="
    
}
	
