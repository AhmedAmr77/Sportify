//
//  NetworkManager.swift
//  Sportify
//
//  Created by Ahmd Amr on 21/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    
    
    
    
    // MARK: Amr Section
    
    
    
    
    
    
    
    
    
    // MARK: Ahmd Section
}

extension NetworkManager : IAllSportsManager{
    func getAllSports(from url: String, allSportsPresenter: IAllSportsPresenter) {
        AF.request(url)
        .validate()
            .responseDecodable(of: AllSportModel.self) { (response) in
                switch response.result {
                case .success( _):
                    print("success")
                    guard let sports = try? response.result.get().sports else {return}
                    allSportsPresenter.onSuccess(sports: sports)
                    break
                    
                case .failure(let error):
                    print(error.errorDescription!)
                    allSportsPresenter.onFailure(errorMessage: error.errorDescription!)
                    break
                }
        }
    }

}
