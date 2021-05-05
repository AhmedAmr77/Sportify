//
//  UpcomingEventsContract.swift
//  Sportify
//
//  Created by Ahmd Amr on 25/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

protocol UpcomingEventViewProtocol: BaseViewProtocol {
    
    func renderViewWithUpcomingEvents(events: [UpcomingEvents])
    func renderViewWithUpcomingEventsTeams(teams: [Team])
}

protocol UpcomingEventPresenterProtocol {
    
    func getEvents(leagueId id: String?, round: String?)
    
    func onSuccess(upcomingEvents: [UpcomingEvents])
    func onFail(errorMessage: String)
    
}

protocol UpcomingEventManagerProtocol {
    
    func getUpcomingEvents(leagueId:String, round: String, completion: @escaping (Result<UpcomingEventsJSON?,NSError>) -> Void)

}
