//
//  SportsAPI.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/27/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
class SportsAPI : BaseAPI<ApplicationNetworking>, IAllSportsManager {
    
    static let shared = SportsAPI()
    
    private override init() {}
    //MARK:-
    func getAllSports(completion: @escaping (Result<AllSportModel?,NSError>) -> Void){
        self.fetchData(target: .getAllSports, responseClass: AllSportModel.self) { (result) in
            completion(result)
        }
    }
    
}

extension SportsAPI : ITeamDetailsManager{
    func getTeamDetails(teamId:String,completion: @escaping (Result<TeamDetailsModel?,NSError>) -> Void){
        self.fetchData(target: .getTeamDetails(id: teamId), responseClass: TeamDetailsModel.self) { (result) in
            completion(result)
        }
    }
}

extension SportsAPI : IAllLeaguesManager{
    func getLeagues(sport:String,completion: @escaping (Result<Leagues?,NSError>) -> Void){
        self.fetchData(target: .getAllLeagues(sport: sport), responseClass: Leagues.self) { (result) in
            completion(result)
        }
    }
}

extension SportsAPI: TeamsManagerProtocol {
    func getTeams(leagueId: String, completion: @escaping (Result<TeamsJSON?, NSError>) -> Void) {
        self.fetchData(target: .getTeams(id: leagueId), responseClass: TeamsJSON.self) { (result) in
            completion(result)
        }
    }
    
    
    
    
}
