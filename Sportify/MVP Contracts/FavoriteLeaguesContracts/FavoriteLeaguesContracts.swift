//
//  FavoriteLeaguesContracts.swift
//  Sportify
//
//  Created by Ahmd Amr on 28/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

protocol FavoriteLeagueViewProtocol: IAllLeaguesView {
    
    func performActionWhenItemDeleted(row:Int)
    
    func onNoConnection()
}

protocol FavoriteLeaguePresenterProtocol: IAllLeaguesPresenter {
   
    func getAllLeagues()
    
    func onItemDelete(row:Int, leagueId id: String?)
    
    func checkConnectivity() -> Bool
    
}
