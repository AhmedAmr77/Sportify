//
//  LocalManager.swift
//  Sportify
//
//  Created by Ahmd Amr on 21/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit
import CoreData

class LocalManager {
    
    ///   SINGLETON
    static let sharedInstance = LocalManager()
    
    private init(){}
    
    
    // another layer
    
    func checkData(id: String, delegate: LeagueDetailsPresenterProtocol) { //check if exist
        print("LocMng - checkData - \(id)")
        let appDelegte: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        print("LocMng - checkData - appDelegte")
        let context = appDelegte.persistentContainer.viewContext
        print("LocMng - checkData - context")
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavoriteLeagues")
        print("LocMng - checkData - fetchReq")
        do{
            let leagues = try context.fetch(fetchReq)
            print("LocMng - checkData - context.fetch")
            for item in leagues {
                print("LocMng - checkData - for item ")
                if let league = item.value(forKey: "leagueId"){
                    if league as! String == id{
                        print("FOUNDDDDDDDDDD")
                        delegate.isFound(founded: true)
                        break
                    } else {
                        print("not11111")
                    }
                } else {
                    print("not22222")
                }
            }
            delegate.isFound(founded: false)         //???????????  line: 63
        } catch {
            print("CAAAAAAAAATCHHHHHHHH")
        }
        delegate.isFound(founded: false)       // is it useful
    }
    
    func addData(leagueId: String, leagueCountry: Country) {              // response onSuccess or Fail
        print("start addToLocal in Presenter")
        let appDelegte = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegte!.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteLeagues", in: context)
        let leagueMngObj = NSManagedObject(entity: entity!, insertInto: context)
    
        leagueMngObj.setValue(leagueId, forKey: "leagueId")
        leagueMngObj.setValue(leagueCountry.strLeague ?? "League", forKey: "leagueName")
        leagueMngObj.setValue(leagueCountry.strBadge, forKey: "leagueBadge")
        leagueMngObj.setValue(leagueCountry.strYoutube ?? "", forKey: "youtubeStr")
        
        do{
            try context.save()
            print("\nDataAddedToLocal")
        } catch {
            print("CATCH WHEN SAVE")
        }
        print("\nDataSaved")
    }
    
    func deleteData(leagueId: String) {                                  // response  onSuccess or Fail
        let appDelegte = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegte!.persistentContainer.viewContext
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavoriteLeagues")
        do{
            let leagues = try context.fetch(fetchReq)
            for item in leagues {
                if let league = item.value(forKey: "leagueId"){
                    if league as! String == leagueId{
                        print("FOUNDDDDDDDDDD  DLT")
                        context.delete(item)
                        try context.save()
                        print("\nDataDeletedFromLocal  DLT")
                        break
                    } else {
                        print("not11111  DLT")
                    }
                } else {
                    print("not22222  DLT")
                }
            }
        } catch {
            print("CAAAAAAAAATCHHHHHHHH  DLT")
        }
        print("Finish Removing  DLT")
    }
    
    func getData(delegate: FavoriteLeaguePresenterProtocol) {
        
        var leaguesArr = [Country]()
        
        let appDelegte = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegte!.persistentContainer.viewContext
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavoriteLeagues")
        do{
            let leagues = try context.fetch(fetchReq)
            for item in leagues {
                if let leagueId = item.value(forKey: "leagueId"){
                    if let leagueName = item.value(forKey: "leagueName"){
                        if let leagueBadge = item.value(forKey: "leagueBadge"){
                            if let youtubeStr = item.value(forKey: "youtubeStr"){
                                leaguesArr.append(Country(idLeague: leagueId as? String, idAPIfootball: nil, strSport: nil, strLeague: leagueName as? String, strLeagueAlternate: nil, strDivision: nil, idCup: nil, strCurrentSeason: nil, intFormedYear: nil, dateFirstEvent: nil, strGender: nil, strCountry: nil, strWebsite: nil, strFacebook: nil, strTwitter: nil, strYoutube: youtubeStr as? String, strRSS: nil, strDescriptionEN: nil, strBadge: leagueBadge as? String, strNaming: nil, strLocked: nil))
                            } else {
                                print("empty YOUTUBE  GET")
                            }
                        } else {
                            print("empty BADEG  GET")
                        }
                    } else {
                        print("empty NAME  GET")
                    }
                } else {
                    print("empty ID  GET")
                }
            }
        } catch (let err) {
            print("CAAAAAAAAATCHHHHHHHH  GET")
            delegate.onFailure(errorMessage: err.localizedDescription)
        }
        print("Finish Retrive  GET")
        
        delegate.onSuccess(leagues: leaguesArr)
        }
    
    // MARK: Amr Section
    
    
    
    
    
    
    
    
    
    // MARK: Ahmd Section
    
}
