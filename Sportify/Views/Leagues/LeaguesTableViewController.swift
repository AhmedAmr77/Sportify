//
//  LeaguesTableViewController.swift
//  Sportify
//
//  Created by Ahmd Amr on 20/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit

class LeaguesTableViewController: UITableViewController {
    
    var sportName:String!
    var leaguesArray = [Country]()
    var presenter:LeaguesPresenter?
    var activityView:UIActivityIndicatorView?


    override func viewDidLoad() {
        super.viewDidLoad()

        //register cell
        let nibCell = UINib(nibName: Constants.LeaguesCellIdentifier, bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: Constants.LeaguesCellIdentifier)
        
        //presenter
        presenter = LeaguesPresenter(delegate: self)
        presenter?.getAllLeagues(from: Constants.allLeaguesURL+"\(sportName!)")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leaguesArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.LeaguesCellIdentifier, for: indexPath) as! LeaguesTableViewCell

        // Configure the cell...
        cell.leagueBadgeImage.sd_setImage(with: URL(string: leaguesArray[indexPath.row].strBadge!), placeholderImage: UIImage(named: "placeholder"))
        cell.leagueNameLabel.text = leaguesArray[indexPath.row].strLeague
        cell.youtubeButton.tag = indexPath.row
        cell.youtubeButton.addTarget(self, action: #selector(clicked(button:)), for: .touchUpInside)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onItemClick(row: indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @objc func clicked(button:UIButton){
        if leaguesArray[button.tag].strYoutube?.count == 0{
            presenter?.onFailure(errorMessage: "Youtube link is not available")
        }else{
            presenter?.onYoutubeClick(row: button.tag)
        }
    }
    
    
    // MARK: Amr Section
    
    
    
    
    
    
    
    
    
    // MARK: Ahmd Section
}

extension LeaguesTableViewController:IAllLeaguesView{
    func renderViewWithAllLeagues(with leaguesArray: [Country]) {
        self.leaguesArray = leaguesArray
        self.tableView.reloadData()
    }
    
    func performActionWhenItemClick(row: Int) {
//        let leagueDetailVC = storyboard?.instantiateViewController(identifier: "LeagueDetailsViewController") as! LeagueDetailsViewController
//        leagueDetailVC.leagueID = leaguesArray[indexPath.row].idLeague
//        navigationController?.pushViewController(leagueDetailVC, animated: true)
    }
    
    func performActionWhenYoutubeClick(row: Int) {
        let webViewVC = storyboard?.instantiateViewController(identifier: Constants.webViewViewController) as! WebViewViewController
        webViewVC.url = leaguesArray[row].strYoutube!
        webViewVC.title = "Youtube"
        navigationController?.pushViewController(webViewVC, animated: true)
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
        var message = ""
        if errorMessage != "Youtube link is not available"{
            message = "Error has Occurred"
        }else{
            message = errorMessage
        }
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel)
        { action -> Void in
            // Put your code here
        })
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
