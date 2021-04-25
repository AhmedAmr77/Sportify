//
//  NetworkManager.swift
//  Sportify
//
//  Created by Ahmd Amr on 21/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//
import Alamofire
import Foundation

class NetworkManager {
    
    
    
    
    
    // MARK: Amr Section
    
    
    
    
    
    
    
    
    
    // MARK: Ahmd Section
    
    func getTeams(leagueId id: Int, teamsPresenterProtocol: TeamsPresenterProtocol) {
        let parameters = ["id": "\(id)"]
        AF.request(Constants.teamsJsonURL, parameters: parameters)
            .validate()
            .responseDecodable(of: TeamsJSON.self) { (response) in
                switch response.result {
                case .success(_):
                    guard let teams = response.value?.teams else {return}
                    teamsPresenterProtocol.onSuccess(teams: teams)
                case .failure(let err):
                    teamsPresenterProtocol.onFail(errorMessage: err.localizedDescription)
                }
        }
    }
    
    func getLastEvents(leagueId id: Int, lastEventsPresenterProtocol: LastEventPresenterProtocol) {
    let parameters = ["id": "\(id)"]
    AF.request(Constants.lastEventJsonURL, parameters: parameters)
            .validate()
            .responseDecodable(of: LastEventsJSON.self) { (response) in
                switch response.result {
                    case .success(_):
                        guard let events = response.value?.events else {return}
                        lastEventsPresenterProtocol.onSuccess(lastEvents: events)
                    case .failure(let err):
                        lastEventsPresenterProtocol.onFail(errorMessage: err.localizedDescription)
                }
        }
    }
    
    func getUpcomingEvents(leagueId id: Int, round:Int, upcomingEventsPresenterProtocol: UpcomingEventPresenterProtocol) {
        let parameters = ["id": "\(id)", "r": "\(round)"]
        AF.request(Constants.upcomingEventJsonURL, parameters: parameters)
            .validate()
            .responseDecodable(of: UpcomingEventsJSON.self) { (response) in
                switch response.result {
                case .success(_):
                    guard let events = response.value?.events else {return}
                    upcomingEventsPresenterProtocol.onSuccess(upcomingEvents: events)
                case .failure(let err):
                    upcomingEventsPresenterProtocol.onFail(errorMessage: err.localizedDescription)
                }
        }
    }
}
