//
//  ApplicationNetworking.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/27/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
import Alamofire

enum ApplicationNetworking{
    case getAllSports
    case getAllLeagues(sport:String)
    case getTeamDetails(id:String)
    case getTeams(id: String)
    case getLastEvents(id: String)
    case getUpcomingEvents(id: String, round: String)
}

extension ApplicationNetworking : TargetType {
    var baseURL: String {
        switch self {
        default:
            return Constants.baseURL
        }
    }
    
    var path: String {
        switch self{
            
        case .getAllSports:
            return Constants.getAllSports
        case .getAllLeagues:
            return Constants.getAllLeagues
        case .getTeamDetails:
            return Constants.getTeamDetails
        case .getTeams:
            return Constants.getTeams
        case .getLastEvents:
            return Constants.getLastEvents
        case .getUpcomingEvents:
            return Constants.getUpcomingEvent
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllSports:
            return .get
        case .getAllLeagues:
            return .get
        case .getTeamDetails:
            return .get
        case .getTeams:
            return .get
        case .getLastEvents:
            return .get
        case .getUpcomingEvents:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllSports:
            return .requestPlain
        case .getAllLeagues(let sport):
            return .requestParameters(parameters: ["s":sport], encoding: URLEncoding.default)
        case .getTeamDetails(let id):
            return .requestParameters(parameters: ["id":id], encoding: URLEncoding.default)   //for get,head or delete use URLEncoding.default
        case .getTeams(let id):
            return .requestParameters(parameters: ["id": id], encoding: URLEncoding.default)
        case .getLastEvents(let id):
            return .requestParameters(parameters: ["id": id], encoding: URLEncoding.default)
        case .getUpcomingEvents(let id, let round):
            return .requestParameters(parameters: ["id": id, "r": round], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    
}
