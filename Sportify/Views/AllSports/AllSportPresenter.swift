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
    var networkManager:NetworkManager?
    
    init(delegate: IAllSportsView) {
        self.delegate = delegate
        networkManager = NetworkManager()
    }
    
    func getAllSports(from url: String) {
        delegate?.showLoading()
        networkManager?.getAllSports(from: url, allSportsPresenter: self)
    }
    
    func onSuccess(sports: [Sport]) {
        delegate?.hideLoading()
        delegate?.renderViewWithAllSports(with: sports)
    }
    
    func onFailure(errorMessage: String) {
        delegate?.hideLoading()
        delegate?.showErrorMessage(errorMessage: errorMessage)
    }
    
}
