//
//  Team Details Contracts.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/25/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
import Foundation
protocol ITeamDetailsView : class, BaseViewProtocol {
    func renderViewWithTeamDetails(with teamDetails: [String:String?])
    func performActionWhenFacebookClick()
    func performActionWhenYoutubeClick()
    func performActionWhenTwitterClick()

}

protocol ITeamDetailsPresenter{
    func getTeamDetails(from url: String)
    func onSuccess(teamDetails: [String:String?])
    func onFailure(errorMessage: String)
    func onFacebookClick()
    func onYoutubeClick()
    func onTwitterClick()
}

protocol ITeamDetailsManager {
    func getTeamDetails(from url: String, teamDetailsPresenter : ITeamDetailsPresenter)
}
