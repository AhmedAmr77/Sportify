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
    
    init(teamsViewProtocol: TeamsViewProtocol) {
        self.teamsViewProtocol = teamsViewProtocol
    }
    
    func getTeams(leagueId id: String?) {
        if let iD = id {
            teamsViewProtocol.showLoading()
            NetworkManager().getTeams(leagueId: iD, teamsPresenterProtocol: self)
        } else {
            teamsViewProtocol.showErrorMessage(errorMessage: "Failed To get This League :(")
        }
        
    }
    
    
    //    Back
    
    func onSuccess(teams: [Team]) {
        teamsViewProtocol.hideLoading()
        teamsViewProtocol.renderViewWithTeams(teams: teams)
    }
    
    func onFail(errorMessage: String) {
        teamsViewProtocol.hideLoading()
        teamsViewProtocol.showErrorMessage(errorMessage: errorMessage)
    }
}
