//
//  LastTableViewCell.swift
//  Sportify
//
//  Created by Ahmd Amr on 23/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit
import SDWebImage

class LastTableViewCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    var lastEventsArray:[LastEvents] = [LastEvents]()
    var lastEventsTeamsArray: [Team] = [Team]()
    
    var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var errorImageView: UIImageView!
  
    @IBOutlet weak var lastEventCollectionView: UICollectionView!{
     didSet{
         self.lastEventCollectionView.delegate = self
         self.lastEventCollectionView.dataSource = self
         
         self.lastEventCollectionView.register(UINib(nibName: "LastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
         self.lastEventCollectionView.reloadData()
     }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let itemSizeH = UIScreen.main.bounds.height * 0.275
        let itemSizeW = UIScreen.main.bounds.width * 0.9
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemSizeW, height: itemSizeH)
//        layout.minimumInteritemSpacing = 25
//        layout.minimumLineSpacing = 12
        layout.scrollDirection = .vertical
        lastEventCollectionView.collectionViewLayout = layout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lastEventsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.lastEventCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LastCollectionViewCell
        cell.team1NameLabel.text = self.lastEventsArray[indexPath.row].strHomeTeam
        cell.team2NameLabel.text = self.lastEventsArray[indexPath.row].strAwayTeam
        
        for item in lastEventsTeamsArray {
                        
            if self.lastEventsArray[indexPath.row].strHomeTeam == item.strTeam  {
                cell.team1ImageView.sd_setImage(with: URL(string: item.strTeamBadge!), placeholderImage: UIImage(named: "placeholder"))
            }
            
            if self.lastEventsArray[indexPath.row].strAwayTeam == item.strTeam  {
                cell.team2ImageView.sd_setImage(with: URL(string: item.strTeamBadge!), placeholderImage: UIImage(named: "placeholder"))
            }
        }
        
        cell.matchDateLabel.text = self.lastEventsArray[indexPath.row].dateEvent ?? "--"

        if let scoreStrHome = self.lastEventsArray[indexPath.row].intHomeScore{
            if let scoreStrAway = self.lastEventsArray[indexPath.row].intAwayScore{
                cell.team1ScoreLabel.text = scoreStrHome
                cell.team2ScoreLabel.text = scoreStrAway
                
                let score1 = Int(scoreStrHome)!
                let score2 = Int(scoreStrAway)!
                
                if(score1 > score2){
                    cell.team1ScoreLabel.backgroundColor = .systemGreen
                    cell.team2ScoreLabel.backgroundColor = .systemRed
                }else if (score2 > score1){
                    cell.team2ScoreLabel.backgroundColor = .systemGreen
                    cell.team1ScoreLabel.backgroundColor = .systemRed
                }else{
                    cell.team2ScoreLabel.backgroundColor = .systemGray4
                    cell.team1ScoreLabel.backgroundColor = .systemGray4
                }
            }else {
                cell.team1ScoreLabel.text = "-"      ///EZAAAAAAAAAAY ??????????????    if remove this line it will be ZERO
                cell.team2ScoreLabel.text = "-"
            }
        } else {
            cell.team1ScoreLabel.text = "-"      ///EZAAAAAAAAAAY ??????????????    if remove this line it will be ZERO
            cell.team2ScoreLabel.text = "-"
        }
        
        cell.layer.cornerRadius = cell.frame.width / 6
        cell.clipsToBounds = true
        cell.layer.borderColor = UIColor.systemGray4.cgColor
        cell.layer.borderWidth = 5.0
        return cell
    }

}

extension LastTableViewCell: LastEventViewProtocol{
    
    func renderViewWithLastEvents(events: [LastEvents]) {
        lastEventsArray = events
        lastEventCollectionView.reloadData()
    }
    
    func renderViewWithLastEventsTeams(teams: [Team]) {
        lastEventsTeamsArray = teams
        lastEventCollectionView.reloadData()
    }
    
    func showLoading() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        self.activityIndicator.center = self.contentView.center
//        self.contentView.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        print("collVi start ActInd   last")
    }
    
    func hideLoading() {
        activityIndicator?.stopAnimating()
        print("collVi stop ActInd   last")
    }
    
    func showErrorMessage(errorMessage: String) {
        errorImageView.isHidden = false
    }
    
    
}
