//
//  TeamsTableViewCell.swift
//  Sportify
//
//  Created by Ahmd Amr on 23/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    var productArray:[(names:String,rent:String,image:String)] = []
    
    
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
        productArray.append((names: "qwew", rent: "$88/month", image: "dummy"))
        productArray.append((names: "bweqb", rent: "$22/month", image: "dummy"))
        productArray.append((names: "wqbccc", rent: "$44/month", image: "dummy"))
        productArray.append((names: "ddsadds", rent: "$66/month", image: "dummy"))
        productArray.append((names: "edaee", rent: "$00/month", image: "dummy"))
        
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
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TeamsCollectionViewCell
        cell.teamImageView.image = UIImage(named:self.productArray[indexPath.row].image)
        cell.teamName.text = "Liverpool"
        
        cell.layer.cornerRadius = cell.frame.width / 2
        cell.clipsToBounds = true
        cell.layer.borderColor = UIColor.systemGray4.cgColor
        cell.layer.borderWidth = 5.0
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let width = (self.frame.size.width - 20) / 8 //some width
//        let height = (self.frame.size.height - 20) / 3
//        print("aaaaa \(width)  \(height)")
//      return CGSize(width: width, height: height)
//    }

}
