//
//  FavoriteLeaguesPresenter.swift
//  Sportify
//
//  Created by Ahmd Amr on 28/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

class FavoriteLeaguesPresenter: FavoriteLeaguePresenterProtocol{
    
    
    weak var delegate:FavoriteLeagueViewProtocol?
    
    var localManager: LocalManager?
    
    init(delegate: FavoriteLeagueViewProtocol) {
        self.delegate = delegate
        localManager = LocalManager.sharedInstance
    }
    
    func getAllLeagues() {
        delegate?.showLoading()
        localManager?.getData(delegate: self)
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
        if checkConnectivity() {
            delegate?.performActionWhenItemClick(row: row)
        }
    }
    
    func onYoutubeClick(row: Int) {
        if checkConnectivity() {
        delegate?.performActionWhenYoutubeClick(row: row)
        }
    }
    
    func onItemDelete(row: Int, leagueId id: String?) {
        delegate?.performActionWhenItemDeleted(row: row)
        localManager?.deleteData(leagueId: id!)
    }

    func checkConnectivity() -> Bool{
        if !Connectivity.isConnectedToInternet {
            delegate?.onNoConnection()
            return false
        }
        return true
    }

    
    
    
    
    
    
      func getAllLeagues(from url: String) {   //adjust contract
    //        delegate?.showLoading()
    //      //  networkManager?.getAllLeagues(from: url, allLeaguesPresenter: self)
        }
}
