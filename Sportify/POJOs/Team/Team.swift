//
//  Team.swift
//  Sportify
//
//  Created by Ahmd Amr on 25/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation

struct TeamsJSON: Codable {
    let teams: [Team]?
}

struct Team: Codable {
    let idTeam: String?
    let strTeam: String?
    let strTeamBadge: String?
}
