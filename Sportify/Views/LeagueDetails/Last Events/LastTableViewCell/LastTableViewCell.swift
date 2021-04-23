//
//  LastTableViewCell.swift
//  Sportify
//
//  Created by Ahmd Amr on 23/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit

class LastTableViewCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    var productArray:[(names:String,rent:String,image:String)] = []
    
    
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
        productArray.append((names: "aaaaaa", rent: "$111/month", image: "dummy"))
        productArray.append((names: "b b", rent: "$777/month", image: "dummy"))
        productArray.append((names: "ccc ccc", rent: "$999/month", image: "dummy"))
        productArray.append((names: "dd d", rent: "$333/month", image: "dummy"))
        productArray.append((names: "e ee", rent: "$555/month", image: "dummy"))
        
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
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.lastEventCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LastCollectionViewCell
        cell.team1NameLabel.text = self.productArray[indexPath.row].names
          cell.team2NameLabel.text = self.productArray[indexPath.row].rent
        cell.team1ImageView.image = UIImage(named:self.productArray[indexPath.row].image)
        cell.team2ImageView.image = UIImage(named:self.productArray[indexPath.row].image)

//        var score1 =
//        var score2 =
        cell.team1ScoreLabel.text = "2" //scoer1
        cell.team2ScoreLabel.text = "3" //score2
//        if(score1 > score2)
        cell.team1ScoreLabel.backgroundColor = .systemGreen
        cell.team2ScoreLabel.backgroundColor = .systemRed
//        else if (score2 > score1)
        cell.team2ScoreLabel.backgroundColor = .systemGreen
        cell.team1ScoreLabel.backgroundColor = .systemRed
//        else
        cell.team2ScoreLabel.backgroundColor = .systemGray4
        cell.team1ScoreLabel.backgroundColor = .systemGray4
        
        
        cell.layer.cornerRadius = cell.frame.width / 6
        cell.clipsToBounds = true
        cell.layer.borderColor = UIColor.systemGray4.cgColor
        cell.layer.borderWidth = 5.0
        return cell
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//       let width = (self.frame.size.width - 20) //some width
//      return CGSize(width: width/3.1, height: 220)
//    }

}
