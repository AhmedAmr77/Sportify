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
    
    var teamId:String?
    var presenter:ITeamDetailsPresenter?
    var teamDetails:[String:String?]=[:]
    var activityView:UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        badgeImage.roundImage()
        teamId = "133618"
        
        //presenter
        presenter = TeamDetailsPresenter(delegate: self)
        presenter?.getTeamDetails(from: Constants.teamDetailsUrl+teamId!)
        
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
        presenter?.onMediaClick(mediaType: "Youtube", url: (teamDetails["strYoutube"] ?? "error") ?? "error")
    }
    
    @IBAction func facebookTapped(_ sender: UITapGestureRecognizer) {
        presenter?.onMediaClick(mediaType: "Facebook", url: (teamDetails["strFacebook"] ?? "error") ?? "error")
    }
    
    @IBAction func twitterTapped(_ sender: UITapGestureRecognizer) {
        presenter?.onMediaClick(mediaType: "Twitter", url: (teamDetails["strTwitter"] ?? "error") ?? "error")
    }
    
    func updateURL() {
        stadiumImage.sd_setImage(with: URL(string: ((teamDetails["strStadiumThumb"]) ?? "") ?? ""), placeholderImage: UIImage(named: "placeholder"))
        badgeImage.sd_setImage(with: URL(string: ((teamDetails["strTeamBadge"]) ?? "") ?? ""), placeholderImage: UIImage(named: "placeholder"))
        jerseyImage.sd_setImage(with: URL(string: ((teamDetails["strTeamJersey"]) ?? "") ?? ""), placeholderImage: UIImage(named: "placeholder"))
        teamNameLabel.text = teamDetails["strTeam"] ?? "-"
        foundedYear.text = teamDetails["intFormedYear"] ?? "-"
        stadiumLabel.text = teamDetails["strStadium"] ?? "-"
        capacityLabel.text = teamDetails["intStadiumCapacity"] ?? "-"
        locationLabel.text = teamDetails["strStadiumLocation"] ?? "-"
        detailsLabel.text = teamDetails["strDescriptionEN"] ?? "-"
    }
    
}

extension TeamDetailsTableViewController:ITeamDetailsView{
    func renderViewWithTeamDetails(with teamDetails: [String : String?]) {
        self.teamDetails = teamDetails
        updateURL()
    }
    
    func performActionWhenMediaClick(mediaType: String,url:String) {
        if(url == "error" || url == ""){
            showErrorMessage(errorMessage: "noLink")
        }else{
           let webViewVC = storyboard?.instantiateViewController(identifier: Constants.webViewViewController) as! WebViewViewController
            webViewVC.url = url
            webViewVC.title = mediaType
//            navigationController?.pushViewController(webViewVC, animated: true)
            present(webViewVC, animated: true, completion: nil)
        }
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
        switch errorMessage {
        case "noLink":
            message = "Sorry, No Link Available"
        default:
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
