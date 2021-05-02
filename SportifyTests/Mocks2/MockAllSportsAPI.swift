//
//  MockAllSportsAPI.swift
//  SportifyTests
//
//  Created by Amr Muhammad on 5/1/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
@testable import Sportify

class MockAllSportsAPI{
    var shouldReturnError:Bool
    
    init(shouldReturnError:Bool) {
        self.shouldReturnError = shouldReturnError
    }
    
    var error:Error!
    
    var allSportsJSONResponse : [String:[[String:Any]]] = ["sports":[["idSport":"102","strSport":"Soccer","strFormat":"TeamvsTeam","strSportThumb":"https://www.thesportsdb.com/images/sports/soccer.jpg","strSportThumbGreen":"https://www.thesportsdb.com/images/sports/motorsport_green2.jpg","strSportDescription":"Association football, more commonly known as football or soccer, is a team sport played between two teams of eleven players with a spherical ball. It is played by 250 million players in over 200 countries and dependencies, making it the world's most popular sport. The game is played on a rectangular field with a goal at each end. The object of the game is to score by getting the ball into the opposing goal.\r\n\r\nPlayers are not allowed to touch the ball with their hands or arms while it is in play, unless they are goalkeepers (and then only when within their penalty area). Other players mainly use their feet to strike or pass the ball, but may also use any part of their body except the hands and the arms. The team that scores the most goals by the end of the match wins. If the score is level at the end of the game, either a draw is declared or the game goes into extra time or a penalty shootout depending on the format of the competition. The Laws of the Game were originally codified in England by The Football Association in 1863. Association football is governed internationally by the International Federation of Association Football (FIFA; French: Fédération Internationale de Football Association), which organises World Cups for both men and women every four years."],
    ["idSport":"103","strSport":"Motorsport","strFormat":"EventSport","strSportThumb":"https://www.thesportsdb.com/images/sports/motorsport.jpg","strSportThumbGreen":"https://www.thesportsdb.com/images/sports/motorsport_green2.jpg","strSportDescription":"Motorsport or motor sport is a global term used to encompass the group of competitive sporting events which primarily involve the use of motorised vehicles, whether for racing or non-racing competition. The terminology can also be used to describe forms of competition of two-wheeled motorised vehicles under the banner of motorcycle racing, and includes off-road racing such as motocross.\r\n\r\nFour- (or more) wheeled motorsport competition is globally governed by the Fédération Internationale de l'Automobile (FIA); and the Fédération Internationale de Motocyclisme (FIM) governs two-wheeled competition."]]]
    
    enum ErrorHandler : Error {
        case returnError
    }
}


extension MockAllSportsAPI : IAllSportsManager {
    
    func getAllSports(completion: @escaping (Result<AllSportModel?, NSError>) -> Void) {
        var allsportsModel = AllSportModel(sports: [])
        do{
            let jsonData = try JSONSerialization.data(withJSONObject: allSportsJSONResponse, options: .fragmentsAllowed)
            allsportsModel = try JSONDecoder().decode(AllSportModel.self, from: jsonData)

        }catch let error{
            print(error.localizedDescription)
        }
        
        if shouldReturnError{
            completion(.failure(error! as NSError))
        }else{
            completion(.success(allsportsModel))
        }
    }
}

