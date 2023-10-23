//
//  WebViewController.swift
//  NewsAPI
//
//  Created by Apple on 17/10/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var MyNewsDetail: WKWebView!
    
    var webURL: URL?

    override func viewDidLoad(){
        super.viewDidLoad()
        
        if let weburll = webURL {
        MyNewsDetail.load(URLRequest(url: weburll))
        }
    }
}
