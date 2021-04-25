//
//  UpcomingCollectionViewCelll.swift
//  Sportify
//
//  Created by Ahmd Amr on 23/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit

class UpcomingCollectionViewCelll: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var matchDateLabel: UILabel!
    
    @IBOutlet weak var team1ImageView: UIImageView!
    @IBOutlet weak var team1NameLabel: UILabel!
    
    @IBOutlet weak var team2ImageView: UIImageView!
    @IBOutlet weak var team2NameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
