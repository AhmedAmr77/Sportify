//
//  LeaguesPresenter.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/24/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
class LeaguesPresenter : IAllLeaguesPresenter{
    weak var delegate:IAllLeaguesView?
    var networkManager:NetworkManager?
    

    init(delegate: IAllLeaguesView) {
        self.delegate = delegate
        networkManager = NetworkManager()
    }
    
    func getAllLeagues(from url: String) {
        delegate?.showLoading()
        networkManager?.getAllLeagues(from: url, allLeaguesPresenter: self)
    }
    
    func onSuccess(leagues: [Country]) {
        delegate?.hideLoading()
        delegate?.renderViewWithAllLeagues(with: leagues)
    }
    
    func onFailure(errorMessage: String) {
        delegate?.hideLoading()
        delegate?.showErrorMessage(errorMessage: errorMessage)
    }
    
    func onItemClick(row: Int) {
        delegate?.performActionWhenItemClick(row: row)
    }
    
    func onYoutubeClick(row: Int) {
        delegate?.performActionWhenYoutubeClick(row: row)
    }
    
    
}




