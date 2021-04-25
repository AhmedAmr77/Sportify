//
//  TeamDetailsTableViewController.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/25/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit

class TeamDetailsTableViewController: UITableViewController {

    @IBOutlet weak var stadiumImage: UIImageView!
    @IBOutlet weak var badgeImage: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var facebookImage: UIImageView!
    @IBOutlet weak var twitterImage: UIImageView!
    @IBOutlet weak var youtubeImage: UIImageView!
    @IBOutlet weak var foundedYear: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var stadiumLabel: UILabel!
    @IBOutlet weak var jerseyImage: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        badgeImage.roundImage()
    }

    // MARK: - Table view data source
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print(tappedImage.tag)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    
    
    @IBAction func youtubeTapped(_ sender: UITapGestureRecognizer) {
        print("youtube")
    }
    
    @IBAction func facebookTapped(_ sender: UITapGestureRecognizer) {
        print("fa")

    }
    
    @IBAction func twitterTapped(_ sender: UITapGestureRecognizer) {
        print("tw")

    }
    
}
