//
//  LeaguesContracts.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/24/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
protocol IAllLeaguesView : class, BaseViewProtocol {
    func renderViewWithAllLeagues(with leaguesArray: [Country])
    func performActionWhenItemClick(row:Int)
    func performActionWhenYoutubeClick(row:Int)
}

protocol IAllLeaguesPresenter{
    func getAllLeagues(from url: String)
    func onSuccess(leagues: [Country])
    func onFailure(errorMessage: String)
    func onItemClick(row:Int)
    func onYoutubeClick(row:Int)
}

protocol IAllLeaguesManager {
//    func getAllLeagues(from url: String, allLeaguesPresenter : IAllLeaguesPresenter)
    func getLeagues(sport:String,completion: @escaping (Result<Leagues?,NSError>) -> Void)
}
