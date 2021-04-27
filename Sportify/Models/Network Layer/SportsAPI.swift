//
//  SportsAPI.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/27/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
class SportsAPI : BaseAPI<ApplicationNetworking>, IAllSportsManager {
    
    static let shared = SportsAPI()
    
    private override init() {}
    //MARK:-
    func getAllSports(completion: @escaping (Result<AllSportModel?,NSError>) -> Void){
        self.fetchData(target: .getAllSports, responseClass: AllSportModel.self) { (result) in
            completion(result)
        }
    }
    
}
