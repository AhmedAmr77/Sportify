//
//  TeamDetailsPresenter.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/25/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
class TeamDetailsPresenter : ITeamDetailsPresenter{

    weak var delegate:ITeamDetailsView?
    var networkManager:NetworkManager?
    
    init(delegate: ITeamDetailsView) {
        self.delegate = delegate
        networkManager = NetworkManager()
    }
    
    func getTeamDetails(from url: String) {
        delegate?.showLoading()
        networkManager?.getTeamDetails(from: url, teamDetailsPresenter: self)
    }
    
    func onSuccess(teamDetails: [String : String?]) {
        delegate?.hideLoading()
        delegate?.renderViewWithTeamDetails(with: teamDetails)
    }
    
    func onFailure(errorMessage: String) {
        delegate?.hideLoading()
        delegate?.showErrorMessage(errorMessage: errorMessage)
    }
    
    func onMediaClick(mediaType: String,url: String) {
        delegate?.performActionWhenMediaClick(mediaType: mediaType,url: url)
    }
    
    
}
