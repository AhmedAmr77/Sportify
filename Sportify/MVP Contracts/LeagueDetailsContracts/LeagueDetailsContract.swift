//
//  LeagueDetailsContract.swift
//  Sportify
//
//  Created by Ahmd Amr on 27/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

protocol LeagueDetailsViewProtocol: BaseViewProtocol {
    
    func isFound(founded: Bool)
    
}

protocol LeagueDetailsPresenterProtocol {
    
    func checkIfFavorite(leagueId id: String?)
    
    
    func isFound(founded: Bool)
    
}
