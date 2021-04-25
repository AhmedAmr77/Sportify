//
//  LasteventsContract.swift
//  Sportify
//
//  Created by Ahmd Amr on 25/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

protocol LastEventViewProtocol: BaseViewProtocol {
    
    func renderViewWithLastEvents(events: [LastEvents])
    func renderViewWithLastEventsTeams(teams: [Team])
}

protocol LastEventPresenterProtocol {
    
    func getEvents(leagueId id: Int?)
    
    func onSuccess(lastEvents: [LastEvents])
    func onFail(errorMessage: String)
    
}
