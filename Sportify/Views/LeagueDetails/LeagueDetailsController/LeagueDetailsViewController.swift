//
//  LeagueDetailsViewController.swift
//  Sportify
//
//  Created by Ahmd Amr on 20/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var teamsArr = [Team]()
    
    var activityIndicator: UIActivityIndicatorView!
    
    var leagueId: Int?
    var round: Int?
    
    
    @IBOutlet weak var upcomingTableView: UITableView!{
        didSet{
            self.upcomingTableView.delegate = self
            self.upcomingTableView.dataSource = self
            self.upcomingTableView.reloadData()
        }
    }
    
    var teamsCell: TeamsTableViewCell?
    var lastEventsCell: LastTableViewCell?
    var upcomingEventsCell: UpcomingTableViewCell?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        teamsCell = TeamsTableViewCell()
        lastEventsCell = LastTableViewCell()
        upcomingEventsCell = UpcomingTableViewCell()
        
        leagueId = 4335
        round = 37
        
        
        getTeamsList(id: leagueId)
        getLastEventsList(id: leagueId)
        getUpcomingEventsList(id:leagueId, round: round)
    
    }
    
    
    func getTeamsList(id: Int?) {
        TeamsPresenter(teamsViewProtocol: self).getTeams(leagueId: id)
    }
    
    func getLastEventsList(id: Int?) {
        LastEventPresenter(lastEventsViewProtocol: self).getEvents(leagueId: id)
    }
    
    func getUpcomingEventsList(id: Int?, round: Int?) {
        UpcomingEventPresenter(upcomingEventsViewProtocol: self).getEvents(leagueId: id, round: round)
    }
    

    
    // MARK: Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            self.upcomingTableView.register(UINib(nibName: "HeaderTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "upcomingTitleCell")
            let cell = self.upcomingTableView.dequeueReusableCell(withIdentifier:"upcomingTitleCell" , for: indexPath) as! HeaderTitleTableViewCell
            cell.headerTitleLabel.text = "UPCOMING EVENTS"
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            return cell
            
        case 1:
            upcomingEventsCell = (self.upcomingTableView.dequeueReusableCell(withIdentifier:"upcomingCell" , for: indexPath) as! UpcomingTableViewCell)
            return upcomingEventsCell!
            
        case 2:
            self.upcomingTableView.register(UINib(nibName: "HeaderTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "lastTitleCell")
            let cell = self.upcomingTableView.dequeueReusableCell(withIdentifier:"lastTitleCell" , for: indexPath) as! HeaderTitleTableViewCell
            cell.headerTitleLabel.text = "LAST EVENTS"
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            return cell
            
        case 3:                                 
            lastEventsCell = (self.upcomingTableView.dequeueReusableCell(withIdentifier:"lastCell" , for: indexPath) as! LastTableViewCell)
            return lastEventsCell!
            
        case 4:
            self.upcomingTableView.register(UINib(nibName: "HeaderTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "teamsTitleCell")
            let cell = self.upcomingTableView.dequeueReusableCell(withIdentifier:"teamsTitleCell" , for: indexPath) as! HeaderTitleTableViewCell
            cell.headerTitleLabel.text = "TEAMS"
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            return cell
            
        default:
            teamsCell = (self.upcomingTableView.dequeueReusableCell(withIdentifier:"teamsCell" , for: indexPath) as! TeamsTableViewCell)
            return teamsCell!
       
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0,2,4:
            return CGFloat(tableView.frame.height * 0.05)
        case 1:
            return CGFloat(tableView.frame.height * 0.275)
        case 3:
            return CGFloat(tableView.frame.height * 0.45)
        default:
            return CGFloat(tableView.frame.height * 0.275)
        }
        
    }
    
    
    // MARK: Amr Section
    
    
    
    
    
    
    
    
    
    // MARK: Ahmd Section
}


// MARK:            EXTENSIONS

extension LeagueDetailsViewController: TeamsViewProtocol{
    
    func renderViewWithTeams(teams: [Team]) {
        teamsArr = teams
        teamsCell?.renderViewWithTeams(teams: teams)
        
        renderViewWithLastEventsTeams(teams: teams)
        renderViewWithUpcomingEventsTeams(teams: teams)
//        lastEventsCell?.renderViewWithLastEventsTeams(teams: teams)
//        upcomingEventsCell?.renderViewWithUpcomingEventsTeams(teams: teams)
    }
    
    
    func showLoading() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        self.activityIndicator.center = self.upcomingTableView.center
        activityIndicator.startAnimating()
        print("start ActInd")
//        lastEventsCell?.showErrorMessage(errorMessage: "asdfsghgfgrtgfvcx")
    }
    
    func hideLoading() {
        activityIndicator.stopAnimating()
        print("stop ActInd")
    }
    
    func showErrorMessage(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        let okAction  = UIAlertAction(title: "Ok", style: .default) { (UIAlertAction) in /*any action needed*/}
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension LeagueDetailsViewController: LastEventViewProtocol{
    
    func renderViewWithLastEvents(events: [LastEvents]) {
        lastEventsCell?.renderViewWithLastEvents(events: events)
    }
    
    func renderViewWithLastEventsTeams(teams: [Team]) {
        lastEventsCell?.renderViewWithLastEventsTeams(teams: teams)
    }
}

extension LeagueDetailsViewController: UpcomingEventViewProtocol{
    
    func renderViewWithUpcomingEvents(events: [UpcomingEvents]) {
        upcomingEventsCell?.renderViewWithUpcomingEvents(events: events)
    }
    
    func renderViewWithUpcomingEventsTeams(teams: [Team]) {
        upcomingEventsCell?.renderViewWithUpcomingEventsTeams(teams: teams)
    }
}
