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
    
    func getEvents(leagueId id: Int?, round: Int?) {
        
        if (id == nil || round == nil){
            upcomingEventsViewProtocol.showErrorMessage(errorMessage: "Failed To get upcoming events for this league :(")
        } else {
            upcomingEventsViewProtocol.showLoading()
            NetworkManager().getUpcomingEvents(leagueId: id!, round: round!, upcomingEventsPresenterProtocol: self)
        }
    }
    
    
    //    Back
    
    func onSuccess(upcomingEvents: [UpcomingEvents]) {
        print("onSecc Presenter")
        upcomingEventsViewProtocol.hideLoading()
        upcomingEventsViewProtocol.renderViewWithUpcomingEvents(events: upcomingEvents)
    }
    
    func onFail(errorMessage: String) {
        upcomingEventsViewProtocol.hideLoading()
        upcomingEventsViewProtocol.showErrorMessage(errorMessage: errorMessage)
    }
}
