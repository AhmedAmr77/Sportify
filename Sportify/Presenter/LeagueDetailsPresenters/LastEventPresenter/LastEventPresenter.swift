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
    
    init(lastEventsViewProtocol: LastEventViewProtocol) {
        self.lastEventsViewProtocol = lastEventsViewProtocol
    }
    
    func getEvents(leagueId id: String?) {
        if let iD = id {
            lastEventsViewProtocol.showLoading()
            NetworkManager().getLastEvents(leagueId: iD, lastEventsPresenterProtocol: self)
        } else {
            lastEventsViewProtocol.showErrorMessage(errorMessage: "2")
        }
    }
    
    
    //    Back
    
    func onSuccess(lastEvents: [LastEvents]) {
        print("onSecc LA Presenter \(lastEvents[0].strHomeTeam) \(lastEvents[0].strStatus) \(lastEvents[1].intRound)")
        lastEventsViewProtocol.hideLoading()
        lastEventsViewProtocol.renderViewWithLastEvents(events: lastEvents)
    }
    
    func onFail(errorMessage: String) {
        print("onFail LA Presenter")
        lastEventsViewProtocol.hideLoading()
        lastEventsViewProtocol.showErrorMessage(errorMessage: "2\(errorMessage)")
    }
}
