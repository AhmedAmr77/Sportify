//
//  LeaguesTableViewCell.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/23/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit

class LeaguesTableViewCell: UITableViewCell {

    @IBOutlet weak var youtubeButton: UIButton!
    @IBOutlet weak var leagueNameLabel: UILabel!
    @IBOutlet weak var leagueBadgeImage: UIImageView!
    @IBOutlet weak var youtubeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
