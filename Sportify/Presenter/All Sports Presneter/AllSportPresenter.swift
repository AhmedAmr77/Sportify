//
//  AllSportPresenter.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/22/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
class AllSportsPresenter: IAllSportsPresenter{
    
    weak var delegate:IAllSportsView?
    var networkManager:IAllSportsManager?
    
    init(delegate: IAllSportsView) {
        self.delegate = delegate
        networkManager = SportsAPI.shared
    }
    
    func getAllSports(from url: String) {
            delegate?.showLoading()
    //        networkManager?.getAllSports(from: url, allSportsPresenter: self)
            networkManager?.getAllSports(completion: { (result) in
                switch result{
                case .success(let response):
                    self.onSuccess(sports: response!.sports)
                case .failure(let error):
                    self.onFailure(errorMessage: error.localizedDescription)
                }
            })
        }
    
    func onSuccess(sports: [Sport]) {
        delegate?.hideLoading()
        delegate?.renderViewWithAllSports(with: sports)
    }
    
    func onFailure(errorMessage: String) {
        delegate?.hideLoading()
        delegate?.showErrorMessage(errorMessage: errorMessage)
    }
    
    func checkConnectivity(){
        if !Connectivity.isConnectedToInternet {
            delegate?.onNoConnection()
        }
    }
    
    func onItemClick(row:Int) {
        delegate?.performActionWhenItemClick(row: row)
    }
    
}
