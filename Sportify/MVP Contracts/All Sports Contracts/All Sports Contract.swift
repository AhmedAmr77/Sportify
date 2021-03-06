//
//  All Sports Contract.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/22/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
protocol IAllSportsView : class, BaseViewProtocol {
    func renderViewWithAllSports(with sportsArray: [Sport])
    func onNoConnection()
    func performActionWhenItemClick(row:Int)
}

protocol IAllSportsPresenter{
    func getAllSports(from url: String)
    func onSuccess(sports: [Sport])
    func onFailure(errorMessage: String)
    func onItemClick(row:Int)
}

protocol IAllSportsManager {
//    func getAllSports(from url: String, allSportsPresenter : IAllSportsPresenter)
    func getAllSports(completion: @escaping (Result<AllSportModel?,NSError>) -> Void)
}
