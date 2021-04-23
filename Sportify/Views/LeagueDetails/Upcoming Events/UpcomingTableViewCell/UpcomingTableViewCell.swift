//
//  UpcomingTableViewCell.swift
//  Sportify
//
//  Created by Ahmd Amr on 23/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit

class UpcomingTableViewCell: UITableViewCell, UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    var productArray:[(names:String,rent:String,image:String)] = []
    
    
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
        productArray.append((names: "Safe Bolrea", rent: "$849/month", image: "dummy"))
        productArray.append((names: "Dining Table", rent: "$949/month", image: "dummy"))
        productArray.append((names: "Fabric Safe", rent: "$999/month", image: "dummy"))
        productArray.append((names: "Safe Bolrea", rent: "$849/month", image: "dummy"))
        productArray.append((names: "Dining Table", rent: "$949/month", image: "dummy"))
        
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
        return productArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.upcomingCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UpcomingCollectionViewCelll
        cell.team1NameLabel.text = self.productArray[indexPath.row].names
          cell.team2NameLabel.text = self.productArray[indexPath.row].rent
        cell.team1ImageView.image = UIImage(named:self.productArray[indexPath.row].image)
        cell.team2ImageView.image = UIImage(named:self.productArray[indexPath.row].image)
        
        cell.layer.cornerRadius = cell.frame.width / 6
        cell.clipsToBounds = true
        cell.layer.borderColor = UIColor.systemGray4.cgColor
        cell.layer.borderWidth = 5.0
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//       let width = (self.frame.size.width - 20) //some width
//
//      return CGSize(width: width/3.1, height: 220)
//    }
    /*
    func shouldInvalidateLayout(forBoundsChange: CGRect) -> Bool {
        if !forBoundsChange.size.equalTo(upcomingCollectionView!.bounds.size) {
//            itemSize = forBoundsChange.size
            return true
        }
        return false
    }*/
}
