//
//  AllSportsViewController.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/22/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit

class AllSportsViewController: UIViewController {
    @IBOutlet weak var allSportsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let nibCell = UINib(nibName: Constants.allSportsCellIdentifier, bundle: nil)
        allSportsCollectionView.register(nibCell, forCellWithReuseIdentifier: Constants.allSportsCellIdentifier)
        // Do any additional setup after loading the view.
    }
    


}


extension AllSportsViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.allSportsCellIdentifier, for: indexPath) as! AllSportsCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
       return CGSize(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset:CGFloat = 20
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
