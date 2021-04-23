//
//  LeagueDetailsViewController.swift
//  Sportify
//
//  Created by Ahmd Amr on 20/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit

class LeagueDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var upcomingTableView: UITableView!{
        didSet{
            self.upcomingTableView.delegate = self
            self.upcomingTableView.dataSource = self
            self.upcomingTableView.reloadData()
            print("reload => didSet")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

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
            let cell = self.upcomingTableView.dequeueReusableCell(withIdentifier:"upcomingCell" , for: indexPath) as! UpcomingTableViewCell
            return cell
            
        case 2:
            self.upcomingTableView.register(UINib(nibName: "HeaderTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "lastTitleCell")
            let cell = self.upcomingTableView.dequeueReusableCell(withIdentifier:"lastTitleCell" , for: indexPath) as! HeaderTitleTableViewCell
            cell.headerTitleLabel.text = "LAST EVENTS"
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            return cell
            
        case 3:                                 
            let cell = self.upcomingTableView.dequeueReusableCell(withIdentifier:"lastCell" , for: indexPath) as! LastTableViewCell
            return cell
            
        case 4:
            self.upcomingTableView.register(UINib(nibName: "HeaderTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "teamsTitleCell")
            let cell = self.upcomingTableView.dequeueReusableCell(withIdentifier:"teamsTitleCell" , for: indexPath) as! HeaderTitleTableViewCell
            cell.headerTitleLabel.text = "TEAMS"
            cell.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            return cell
            
        default:
            let cell = self.upcomingTableView.dequeueReusableCell(withIdentifier:"teamsCell" , for: indexPath) as! TeamsTableViewCell
            return cell
       
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    // MARK: Amr Section
    
    
    
    
    
    
    
    
    
    // MARK: Ahmd Section
}
