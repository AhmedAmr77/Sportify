//
//  TeamsPresenter.swift
//  Sportify
//
//  Created by Ahmd Amr on 25/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

class TeamsPresenter: TeamsPresenterProtocol {
    
    var teamsViewProtocol: TeamsViewProtocol!
    
    var networkManager: TeamsManagerProtocol?
    
    init(teamsViewProtocol: TeamsViewProtocol) {
        self.teamsViewProtocol = teamsViewProtocol
        networkManager = SportsAPI.shared
    }
    
    func getTeams(leagueId id: String?) {
        teamsViewProtocol.showLoading()
        networkManager?.getTeams(leagueId: id!, completion: { (result) in
            switch result {
            case .success(let response):
                if let teams = response?.teams {
                    self.onSuccess(teams: teams)
                } else {
                    self.onFail(errorMessage: "")
                }
                
            case .failure(let error):
                self.onFail(errorMessage: error.localizedDescription)
            }
        })
        
//        if let iD = id {
//            teamsViewProtocol.showLoading()
//            NetworkManager().getTeams(leagueId: iD, teamsPresenterProtocol: self)
//        } else {
//            teamsViewProtocol.showErrorMessage(errorMessage: "3")
//        }
        
    }
    
    
    //    Back
    
    func onSuccess(teams: [Team]) {
//        print("onSucc TM Presenter \(teams[0].idTeam) \(teams[0].strTeam)")
        teamsViewProtocol.hideLoading()
        teamsViewProtocol.renderViewWithTeams(teams: teams)
    }
    
    func onFail(errorMessage: String) {
//        print("onFail TM Presenter")
        teamsViewProtocol.hideLoading()
        teamsViewProtocol.showErrorMessage(errorMessage: "3\(errorMessage)")
    }
}
