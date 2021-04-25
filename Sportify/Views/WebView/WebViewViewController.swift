//
//  WebViewViewController.swift
//  Sportify
//
//  Created by Amr Muhammad on 4/24/21.
//  Copyright © 2021 ITI-41. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    var url:String!
    var webType:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let myURL = URL(string: "https://"+url)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
}
