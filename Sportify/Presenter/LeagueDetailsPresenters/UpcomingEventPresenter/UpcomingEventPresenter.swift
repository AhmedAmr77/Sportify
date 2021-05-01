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
    
    var networkManager: UpcomingEventManagerProtocol?
    
    init(upcomingEventsViewProtocol: UpcomingEventViewProtocol) {
        self.upcomingEventsViewProtocol = upcomingEventsViewProtocol
        networkManager = SportsAPI.shared
    }
    
    func getEvents(leagueId id: String?, round: String?) {
        upcomingEventsViewProtocol.showLoading()
        if let round = round {
            networkManager?.getUpcomingEvents(leagueId: id!, round: round, completion: { (result) in
                switch result {
                case .success(let response):
                    if let safeResponse = response?.events{
                        self.onSuccess(upcomingEvents: safeResponse)
                    } else {
                        self.onFail(errorMessage: "")
                    }
                case .failure(let error):
                    self.onFail(errorMessage: error.localizedDescription)
                }
            })
        } else {
            self.onFail(errorMessage: "")
            print("UP round Nil")
        }
        
        
//        if (id == nil || round == nil){
//            upcomingEventsViewProtocol.showErrorMessage(errorMessage: "1")
//        } else {
//            upcomingEventsViewProtocol.showLoading()
//            NetworkManager().getUpcomingEvents(leagueId: id!, round: round!, upcomingEventsPresenterProtocol: self)
//        }
    }
    
    
    //    Back
    
    func onSuccess(upcomingEvents: [UpcomingEvents]) {
//        print("onSecc UP Presenter \(upcomingEvents[0].idEvent) \(upcomingEvents[0].strStatus)")
        upcomingEventsViewProtocol.hideLoading()
        upcomingEventsViewProtocol.renderViewWithUpcomingEvents(events: upcomingEvents)
    }
    
    func onFail(errorMessage: String) {
        print("onFail UP Presenter")
        upcomingEventsViewProtocol.hideLoading()
        upcomingEventsViewProtocol.showErrorMessage(errorMessage: "1\(errorMessage)")
    }
}
