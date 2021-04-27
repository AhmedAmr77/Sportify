//
//  NetworkManager.swift
//  Sportify
//
//  Created by Ahmd Amr on 21/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//
import Alamofire
import Foundation
import Alamofire

class NetworkManager {
    
    
    
    
    
    // MARK: Amr Section
    
    
    
    
    
    
    
    
    
    // MARK: Ahmd Section
    
    func getTeams(leagueId id: String, teamsPresenterProtocol: TeamsPresenterProtocol) {
        let parameters = ["id": id]
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
    
    func getLastEvents(leagueId id: String, lastEventsPresenterProtocol: LastEventPresenterProtocol) {
    let parameters = ["id": id]
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
    
    func getUpcomingEvents(leagueId id: String, round:Int, upcomingEventsPresenterProtocol: UpcomingEventPresenterProtocol) {
        let parameters = ["id": id, "r": "\(round)"]
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

//extension NetworkManager : IAllSportsManager{
//    func getAllSports(from url: String, allSportsPresenter: IAllSportsPresenter) {
//        AF.request(url)
//            .validate()
//            .responseDecodable(of: AllSportModel.self) { (response) in
//                switch response.result {
//                case .success( _):
//                    print("success")
//                    guard let sports = try? response.result.get().sports else {return}
//                    allSportsPresenter.onSuccess(sports: sports)
//                    break
//
//                case .failure(let error):
//                    print(error.errorDescription!)
//                    allSportsPresenter.onFailure(errorMessage: error.errorDescription!)
//                    break
//                }
//        }
//    }
//}

//extension NetworkManager : IAllLeaguesManager{
//    func getAllLeagues(from url: String, allLeaguesPresenter: IAllLeaguesPresenter) {
//        AF.request(url)
//            .validate()
//            .responseDecodable(of: Leagues.self) { (response) in
//                switch response.result {
//                case .success( _):
//                    print("success")
//                    guard let leagues = try? response.result.get().countrys else {return}
//                    allLeaguesPresenter.onSuccess(leagues: leagues)
//                    break
//                    
//                case .failure(let error):
//                    print(error.errorDescription!)
//                    allLeaguesPresenter.onFailure(errorMessage: error.errorDescription!)
//                    break
//                }
//        }
//    }
//}

//extension NetworkManager : ITeamDetailsManager{
//    func getTeamDetails(from url: String, teamDetailsPresenter: ITeamDetailsPresenter) {
//        AF.request(url)
//            .validate()
//            .responseDecodable(of: TeamDetailsModel.self) { (response) in
//                switch response.result {
//                case .success( _):
//                    print("success")
//                    guard let teamDetails = try? response.result.get().teams[0] else {return}
//                    teamDetailsPresenter.onSuccess(teamDetails: teamDetails)
//                    break
//                    
//                case .failure(let error):
//                    print(error.errorDescription!)
//                    teamDetailsPresenter.onFailure(errorMessage: error.errorDescription!)
//                    break
//                }
//        }
//    }}
