//
//  UpcomingTableViewCell.swift
//  Sportify
//
//  Created by Ahmd Amr on 23/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit
import SDWebImage

class UpcomingTableViewCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var upcomingEventsArray:[UpcomingEvents] = [UpcomingEvents]()
    var upcomingEventsTeamsArray: [Team] = [Team]()
    
//    var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var errorImageView: UIImageView!
    
    @IBOutlet weak var upcomingCollectionView: UICollectionView!{
        didSet{
            self.upcomingCollectionView.delegate = self
            self.upcomingCollectionView.dataSource = self
            
            self.upcomingCollectionView.register(UINib(nibName: "UpcomingCollectionViewCelll", bundle: nil), forCellWithReuseIdentifier: "cell")
            self.upcomingCollectionView.reloadData()
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let itemSizeW = UIScreen.main.bounds.width / 1.5
        let itemSizeH = UIScreen.main.bounds.width / 2.75
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemSizeW, height: itemSizeH)
        layout.minimumInteritemSpacing = 5
//        layout.minimumLineSpacing = 3
        layout.scrollDirection = .horizontal
        upcomingCollectionView.collectionViewLayout = layout
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upcomingEventsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UpcomingCollectionViewCelll
        cell.team1NameLabel.text = self.upcomingEventsArray[indexPath.row].strHomeTeam
        cell.team2NameLabel.text = self.upcomingEventsArray[indexPath.row].strAwayTeam
        
        for item in upcomingEventsTeamsArray {
                        
            if self.upcomingEventsArray[indexPath.row].strHomeTeam == item.strTeam  {
                cell.team1ImageView.sd_setImage(with: URL(string: item.strTeamBadge ?? ""), placeholderImage: UIImage(named: "placeholder"))
            }
            
            if self.upcomingEventsArray[indexPath.row].strAwayTeam == item.strTeam  {
                cell.team2ImageView.sd_setImage(with: URL(string: item.strTeamBadge ?? ""), placeholderImage: UIImage(named: "placeholder"))
            }
        }
        
        cell.matchDateLabel.text = "\(upcomingEventsArray[indexPath.row].dateEvent ?? "---")  @  \(upcomingEventsArray[indexPath.row].strTime?.prefix(5) ?? "--:--")"
        
        cell.layer.cornerRadius = cell.frame.width / 6
        cell.clipsToBounds = true
        cell.layer.borderColor = UIColor.systemGray4.cgColor
        cell.layer.borderWidth = 5.0
        return cell
    }

}

extension UpcomingTableViewCell: UpcomingEventViewProtocol{
    
    func renderViewWithUpcomingEvents(events: [UpcomingEvents]) {
        upcomingEventsArray = events
        upcomingCollectionView.reloadData()
    }
    
    func renderViewWithUpcomingEventsTeams(teams: [Team]) {
        upcomingEventsTeamsArray = teams
        upcomingCollectionView.reloadData()
    }
    
    func showLoading() {
//        activityIndicator = UIActivityIndicatorView(style: .large)
//        activityIndicator.hidesWhenStopped = true
//        self.activityIndicator.center = self.contentView.center
//        self.contentView.addSubview(self.activityIndicator)
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        print("collVi start ActInd   upcoming")
    }
    
    func hideLoading() {
        activityIndicator?.stopAnimating()
        print("collVi stop ActInd   upcoming")
    }
    
    func showErrorMessage(errorMessage: String) {
        errorImageView.isHidden = false
        print("UP showErrorImg Cell")
    }
    
    
}
