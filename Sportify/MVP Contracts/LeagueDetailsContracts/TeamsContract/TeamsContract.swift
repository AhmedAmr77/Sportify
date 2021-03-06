//
//  TeamsContract.swift
//  Sportify
//
//  Created by Ahmd Amr on 25/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

protocol TeamsViewProtocol: BaseViewProtocol {
    
    func renderViewWithTeams(teams: [Team])
    
//    func getRow(teamsViewProtocol: TeamsViewProtocol)
    func selectedRow(row: Int)
}

protocol TeamsPresenterProtocol {
    
    func getTeams(leagueId id: String?)
    
    func onSuccess(teams: [Team])
    func onFail(errorMessage: String)
    
}

protocol TeamsManagerProtocol {
    
    func getTeams(leagueId:String,completion: @escaping (Result<TeamsJSON?,NSError>) -> Void)

}
