//
//  TeamsTableViewCell.swift
//  Sportify
//
//  Created by Ahmd Amr on 23/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit
import SDWebImage

class TeamsTableViewCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    var teamsArray: [Team] = [Team]()
    
    var activityIndicator: UIActivityIndicatorView!
    
    var controllerDelegate: TeamsViewProtocol?
    
    
    @IBOutlet weak var errorImageView: UIImageView!
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!{
        didSet{
            self.teamsCollectionView.delegate = self
            self.teamsCollectionView.dataSource = self
            
            self.teamsCollectionView.register(UINib(nibName: "TeamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
            self.teamsCollectionView.reloadData()
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let itemSize = UIScreen.main.bounds.width/3
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .horizontal
        teamsCollectionView.collectionViewLayout = layout
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teamsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TeamsCollectionViewCell
        cell.teamImageView.sd_setImage(with: URL(string: teamsArray[indexPath.row].strTeamBadge!), placeholderImage: UIImage(named: "placeholder"))
        cell.teamName.text = teamsArray[indexPath.row].strTeam
        
        cell.layer.cornerRadius = cell.frame.width / 4
        cell.clipsToBounds = true
        cell.layer.borderColor = UIColor.systemGray4.cgColor
        cell.layer.borderWidth = 5.0
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        controllerDelegate?.selectedRow(row: indexPath.row)
    }
}

extension TeamsTableViewCell: TeamsViewProtocol{
    
    func selectedRow(row: Int){
        
    }
    
    func renderViewWithTeams(teams: [Team]) {
        teamsArray = teams
        teamsCollectionView.reloadData()
    }
    
    func showLoading() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        self.activityIndicator.center = self.teamsCollectionView.center
        activityIndicator.startAnimating()
        print("collVi start ActInd")
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
        print("collVi stop ActInd")
    }
    
    func showErrorMessage(errorMessage: String) {
        errorImageView.isHidden = false
    }
    
    
}
