//
//  DetailViewController.swift
//  TheNYTimesDemo
//
//  Created by Admin on 7/23/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var detailWebView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var urlString :String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailWebView.navigationDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let url = URL(string: urlString!)
        let request = URLRequest(url: url!)
        detailWebView.load(request)
        
    }
    
    
    func load(with UrlString: String){
        self.urlString = UrlString
    }
    
}

extension DetailViewController {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    
    
    
}
