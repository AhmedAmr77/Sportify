//
//  Reachabilityy.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/22/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import Foundation
import Alamofire

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        return self.sharedInstance.isReachable
    }
}



extension UIImageView{
    func roundImage(){
        self.layer.cornerRadius = self.frame.size.width/2.0
        self.layer.borderColor = #colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)
        self.layer.borderWidth = 2.0
    }
}
