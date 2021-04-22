//
//  AllSportsViewController.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/22/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit
import SDWebImage

class AllSportsViewController: UIViewController {
    @IBOutlet weak var allSportsCollectionView: UICollectionView!
    var sportsArray = [Sport]()
    var presenter:AllSportsPresenter?
    var activityView:UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register cell
        let nibCell = UINib(nibName: Constants.allSportsCellIdentifier, bundle: nil)
        allSportsCollectionView.register(nibCell, forCellWithReuseIdentifier: Constants.allSportsCellIdentifier)
        
        //presenter
        presenter = AllSportsPresenter(delegate: self)
        presenter?.getAllSports(from: Constants.allSportsURL)
        
    }
    
    
    
}


extension AllSportsViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sportsArray.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.allSportsCellIdentifier, for: indexPath) as! AllSportsCollectionViewCell
        
        cell.sportNameLabel.text = sportsArray[indexPath.row].strSport
        cell.sportsImage.sd_setImage(with: URL(string: sportsArray[indexPath.row].strSportThumb), placeholderImage: UIImage(named: "placeholder"))
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

extension AllSportsViewController : IAllSportsView{
    func renderViewWithAllSports(with sportsArray: [Sport]) {
        self.sportsArray = sportsArray
        self.allSportsCollectionView.reloadData()
    }
    
    
    
    func showLoading() {
        activityView = UIActivityIndicatorView(style: .large)
        activityView!.center = self.view.center
        self.view.addSubview(activityView!)
        activityView!.startAnimating()
    }
    
    func hideLoading() {
        activityView!.stopAnimating()
    }
    
    func showErrorMessage(errorMessage: String) {
        let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel)
        { action -> Void in
            // Put your code here
        })
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
