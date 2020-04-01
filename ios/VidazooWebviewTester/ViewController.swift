//
//  ViewController.swift
//  VidazooWebviewTester
//
//  Created by Udi Talias on 3/7/19.
//  Copyright © 2019 Allinviews LTD. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {

    @IBOutlet weak var webview: WKWebView!
    
    @IBOutlet weak var address: UITextField!
    
    @IBOutlet weak var loadBtn: UIButton!
    
    var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createActivityIndicator()
        
        self.webview.navigationDelegate = self
        
        self.address.delegate = self
        self.address.clearButtonMode = .whileEditing
        self.address.text = "https://saas-player-demo-pages.herokuapp.com/in-article.html";
    }
    
    func createActivityIndicator() {
        indicator = UIActivityIndicatorView(style: .gray)
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.stopAnimating()
        view.addSubview(indicator)
        
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loadWebview()
        return false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        indicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicator.stopAnimating()
    }
    
    @IBAction func onLoadClick(_ sender: Any) {
        loadWebview()
    }
    
    private func loadWebview() {
        guard let url = self.address.text else {
            return
        }
        
        address.resignFirstResponder()
        
        let urlObj = NSURL(string: url)
        let req = URLRequest(url: urlObj! as URL)

        self.webview.load(req)
    }
}
