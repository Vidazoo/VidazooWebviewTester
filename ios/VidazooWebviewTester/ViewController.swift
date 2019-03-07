//
//  ViewController.swift
//  VidazooWebviewTester
//
//  Created by Udi Talias on 3/7/19.
//  Copyright © 2019 Allinviews LTD. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var loadBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.address.text = "https://saas-player-demo-pages.herokuapp.com/in-article.html";
    }
    
    @IBAction func onLoadClick(_ sender: Any) {
        let url = self.address.text;
        
        if (url != "") {
            let url = URL(string: url!);
            let req = URLRequest(url: url!);
            
            self.webview.load(req);
        }
    }
}
