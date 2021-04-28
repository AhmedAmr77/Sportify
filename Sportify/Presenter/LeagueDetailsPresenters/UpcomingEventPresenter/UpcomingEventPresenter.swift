//
//  UpcomingEventPresenter.swift
//  Sportify
//
//  Created by Ahmd Amr on 25/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

class UpcomingEventPresenter: UpcomingEventPresenterProtocol {
     
    var upcomingEventsViewProtocol: UpcomingEventViewProtocol!
    
    init(upcomingEventsViewProtocol: UpcomingEventViewProtocol) {
        self.upcomingEventsViewProtocol = upcomingEventsViewProtocol
    }
    
    func getEvents(leagueId id: String?, round: Int?) {
        
        if (id == nil || round == nil){
            upcomingEventsViewProtocol.showErrorMessage(errorMessage: "1")
        } else {
            upcomingEventsViewProtocol.showLoading()
            NetworkManager().getUpcomingEvents(leagueId: id!, round: round!, upcomingEventsPresenterProtocol: self)
        }
    }
    
    
    //    Back
    
    func onSuccess(upcomingEvents: [UpcomingEvents]) {
        print("onSecc UP Presenter \(upcomingEvents[0].idEvent) \(upcomingEvents[0].strStatus)")
        upcomingEventsViewProtocol.hideLoading()
        upcomingEventsViewProtocol.renderViewWithUpcomingEvents(events: upcomingEvents)
    }
    
    func onFail(errorMessage: String) {
        print("onFail UP Presenter")
        upcomingEventsViewProtocol.hideLoading()
        upcomingEventsViewProtocol.showErrorMessage(errorMessage: "1\(errorMessage)")
    }
}
