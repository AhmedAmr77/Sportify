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
        
    var localSharedInstance: LocalManager?
    
    var leagueDetailsViewProtocol: LeagueDetailsViewProtocol!
    
    init(leagueDetailsViewProtocol: LeagueDetailsViewProtocol) {
        self.leagueDetailsViewProtocol = leagueDetailsViewProtocol
        localSharedInstance = LocalManager.sharedInstance
    }
    
 
    func checkIfFavorite(leagueId id: String) {
        print("DetLeg - checkIfFavorite - \(id)")
        localSharedInstance?.checkData(id: id, delegate: self)
    }
    
    func isFound(founded: Bool) {
        leagueDetailsViewProtocol.isFound(founded: founded)
    }
    
    func addToLocal(leagueId: String, leagueCountry: Country) {
        localSharedInstance?.addData(leagueId: leagueId, leagueCountry: leagueCountry)
    }
    
    func removeFromLocal(leagueId id: String) {
        localSharedInstance?.deleteData(leagueId: id)
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
