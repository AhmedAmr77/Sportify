//
//  LastEventPresenter.swift
//  Sportify
//
//  Created by Ahmd Amr on 25/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

class LastEventPresenter: LastEventPresenterProtocol {
    
    var lastEventsViewProtocol: LastEventViewProtocol!
    
    var networkManager: LastEventManagerProtocol?
    
    init(lastEventsViewProtocol: LastEventViewProtocol) {
        self.lastEventsViewProtocol = lastEventsViewProtocol
        networkManager = SportsAPI.shared
    }
    
    func getEvents(leagueId id: String?) {
        lastEventsViewProtocol.showLoading()
        networkManager?.getLastEvents(leagueId: id!, completion: { (result) in
            switch result {
            case .success(let response):
                self.onSuccess(lastEvents: response!.events!)
            case .failure(let error):
                self.onFail(errorMessage: error.localizedDescription)
            }
        })
//        if let iD = id {
//            lastEventsViewProtocol.showLoading()
//            NetworkManager().getLastEvents(leagueId: iD, lastEventsPresenterProtocol: self)
//        } else {
//            lastEventsViewProtocol.showErrorMessage(errorMessage: "2")
//        }
    }
    
    
    //    Back
    
    func onSuccess(lastEvents: [LastEvents]) {
//        print("onSecc LA Presenter \(lastEvents[0].strHomeTeam) \(lastEvents[0].strStatus) \(lastEvents[1].intRound)")
        lastEventsViewProtocol.hideLoading()
        lastEventsViewProtocol.renderViewWithLastEvents(events: lastEvents)
    }
    
    func onFail(errorMessage: String) {
//        print("onFail LA Presenter")
        lastEventsViewProtocol.hideLoading()
        lastEventsViewProtocol.showErrorMessage(errorMessage: "2\(errorMessage)")
    }
}
