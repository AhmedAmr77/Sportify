//
//  LeagueDetailsPresenter.swift
//  Sportify
//
//  Created by Ahmd Amr on 27/04/2021.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit
import CoreData

class LeagueDetailsPresenter: LeagueDetailsPresenterProtocol {
    
    
    
    
    
    
    //      sugg : add base Contract here !!
    
//    var teamsViewProtocol: TeamsViewProtocol!
//
//    init(teamsViewProtocol: TeamsViewProtocol) {
//        self.teamsViewProtocol = teamsViewProtocol
//    }
    
    var leagueDetailsViewProtocol: LeagueDetailsViewProtocol!
    
    var appDelegte: AppDelegate?
    var leagueMngObj: NSManagedObject?
    
    init(leagueDetailsViewProtocol: LeagueDetailsViewProtocol) {
        self.leagueDetailsViewProtocol = leagueDetailsViewProtocol
        appDelegte = UIApplication.shared.delegate as? AppDelegate
    }
    
 
    func checkIfFavorite(leagueId id: String) {
        let context = appDelegte!.persistentContainer.viewContext
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavoriteLeagues")

        do{
            let leagues = try context.fetch(fetchReq)
            
            for league in leagues {
                if let item = league.value(forKey: "leagueId"){
                    if item as! String == id{
                        print("FOUNDDDDDDDDDD")
                        leagueDetailsViewProtocol.isFound(founded: true)
                        break
                    } else {
                        print("not11111")
                    }
                } else {
                    print("not22222")
                }
            }
            leagueDetailsViewProtocol.isFound(founded: false)         //???????????  line: 63
        } catch {
            print("CAAAAAAAAATCHHHHHHHH")
        }
        leagueDetailsViewProtocol.isFound(founded: false)
    }
    
    
    func addToLocal(leagueId: String, teams: [Team], upc: [UpcomingEvents], las: [LastEvents]) {
        print("start addToLocal in Presenter")
        let appDelg = UIApplication.shared.delegate as? AppDelegate
        let context = appDelg!.persistentContainer.viewContext
        
        print("\nDataAddedToArr")
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteLeagues", in: context)
        print("\n11111111")
        leagueMngObj = NSManagedObject(entity: entity!, insertInto: context)
        print("\n22222222")
        do{
            leagueMngObj?.setValue(leagueId, forKey: "leagueId")
            print("\n333333")
            let teamsData = try NSKeyedArchiver.archivedData(withRootObject: teams, requiringSecureCoding: false)
            print("\n44444")
            leagueMngObj?.setValue(teamsData, forKey: "teams")
            print("\n555555")
            let upcomingData = try NSKeyedArchiver.archivedData(withRootObject: upc, requiringSecureCoding: false)
            leagueMngObj?.setValue(upcomingData, forKey: "upcomingEvents")
            let lastData = try NSKeyedArchiver.archivedData(withRootObject: las, requiringSecureCoding: false)
            leagueMngObj?.setValue(lastData, forKey: "lastEvents")
        } catch {
            print("error occurred  archiving")
        }
        do{
            try context.save()
            print("\nDataAddedToLocal")
        } catch {
            print("CATCH WHEN SAVE")
        }
        
        print("\nDataSaved")
    }
    
    func removeFromLocal(leagueId id: String) {
        let context = appDelegte!.persistentContainer.viewContext
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavoriteLeagues")

        do{
            let leagues = try context.fetch(fetchReq)
            
            for league in leagues {
                if let item = league.value(forKey: "leagueId"){
                    if item as! String == id{
                        print("FOUNDDDDDDDDDD  DLT")
                        context.delete(item as! NSManagedObject)
                        break
                    } else {
                        print("not11111  DLT")
                    }
                } else {
                    print("not22222  DLT")
                }
            }
            
            try context.save()
            print("\nDataDeletedFromLocal  DLT")
        } catch {
            print("CAAAAAAAAATCHHHHHHHH  DLT")
        }
        
        print("Finish Removing  DLT")
    }
}
   
//    func checkIfFavorite(leagueId: String){
//        //check if favorite when controller starts to fill favorite btn
//
//
//
//
//
//
//
//        //        fetchReq.predicate = NSPredicate(format: "leagueId = %@", leagueId)
////
////        do{
////            try context.execute(fetchReq)
////            print("\nData FOUND")
////        } catch {
////            print("CATCH WHEN Search ")
////        }
//
//
//
////            if fetchResults.count != 0 {
////                // update
////                var managedObject = fetchResults[0]
////                managedObject.setValue(accessToken, forKey: "accessToken")
////
////                context.save(nil)
////            } else {
////                //insert as new data
////            }
//
//
//        /*
//         var fetchRequest = NSFetchRequest(entityName: "Users")
//         fetchRequest.predicate = NSPredicate(format: "userName = %@", userName)
//
//         if let fetchResults = appDel.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject] {
//             if fetchResults.count != 0 {
//                 // update
//                 var managedObject = fetchResults[0]
//                 managedObject.setValue(accessToken, forKey: "accessToken")
//
//                 context.save(nil)
//             } else {
//                 //insert as new data
//             }
//         }
//         */
//
//        /*
//         func saveLoginData(accessToken: String, userName: String) {
//             var appDel: AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
//             var context: NSManagedObjectContext = appDel.managedObjectContext!
//
//             var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LoginData")
//             fetchRequest.predicate = NSPredicate(format: "userName = %@", userName)
//
//             if let fetchResults = appDel.managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [NSManagedObject] {
//                 if fetchResults.count != 0{
//
//                     var managedObject = fetchResults[0]
//                     managedObject.setValue(accessToken, forKey: "accessToken")
//
//                     context.save(nil)
//                 }
//             }
//         }
//         */
////        var league: [NSManagedObject] = []
//
////        if let league = context.existingObject(with: NSManagedObjectID) {
////            request.predicate = NSPredicate(format: "person = %@", myPerson)
////        }
//
////        do {
////            league = try context.fetch(fetchReq)
////        } catch let error as NSError {
////            print("Could not fetch. \(error), \(error.userInfo)")
////        }
//
//        /*
//
//
//
//          //2
//          let fetchRequest =
//            NSFetchRequest<NSManagedObject>(entityName: "Person")
//
//          //3
//
//         */
//
//        /*
//         let context = appDelegte!.persistentContainer.viewContext
//
//                 do{
//                     let moviesMngObjArr = try context.fetch(fetchReq)
//                     for mngObj in moviesMngObjArr {
//                         let safeImage = mngObj.value(forKey: "image") ?? "dummy"
//                         let safeTitle = mngObj.value(forKey: "title") ?? "No Title"
//                         let safeRate = mngObj.value(forKey: "rate") ?? 0.0
//                         let safeReleaseYear = mngObj.value(forKey: "releaseYear") ?? 0
//         //                if let intReleaseYear = mngObj.value(forKey: "releaseYear") {
//         //                    var intt = intReleaseYear as! Int16
//         //                }
//         //                    let safeGenre = mngObj.value(forKey: "genre") ?? ["No Genre"]
//         //                    let safeGenreArr = NSKeyedUnarchiver.unarchiveObject(with: safeGenre as! Data) as! [String]
//                         let safeGenreArr: [String]?
//                         if let myData = mngObj.value(forKey: "genre"){
//                             if let genArr = NSKeyedUnarchiver.unarchiveObject(with: myData as! Data) as? [String]{
//                                 print("inGENRE")
//                                 safeGenreArr = genArr
//                             } else {
//                                 safeGenreArr = ["Empty Genre"]
//                             }
//                         } else {
//                             safeGenreArr = ["No Genre"]
//                         }
//                         print("title is \(safeTitle)")
//                         moviesArr.append(MovieData(title: safeTitle as! String, img: safeImage as! String, rating: safeRate as! Float, releaseYear: safeReleaseYear as! Int, genre: safeGenreArr!))
//                     }
//                     tableView.reloadData()
//                     self.indicator.stopAnimating()
//                 } catch {
//                     print("CATCH EXCEPTION")
//                 }
//         */
//    }
