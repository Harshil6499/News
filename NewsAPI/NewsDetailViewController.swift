//
//  NewsDetailViewController.swift
//  NewsAPI
//
//  Created by Apple on 05/10/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
import WebKit


class NewsDetailViewController: UIViewController,WKNavigationDelegate {

    
    @IBOutlet weak var MyNewsHeadLinelbl: UILabel!
    @IBOutlet weak var MyNewsImagePasslbl: UIImageView!
    @IBOutlet weak var MyNewsDescriptionlbl: UILabel!
    @IBOutlet weak var MyNewsContentlbl: UILabel!
    @IBOutlet weak var MyNewsWebUrlbl: UILabel!
    
    var newsheadline:String = " "
    var newspasslbl = ""
    var newsdescription:String = " "
    var newscontent:String = " "
    var newsurl:String = " "
    
    
    
    @IBAction func ok(_ sender: Any) {
        if let web = MyNewsWebUrlbl.text, let url = URL(string: web) {
                let VC = storyboard?.instantiateViewController(withIdentifier: "WebView") as! WebViewController
                VC.webURL = url
                self.navigationController?.pushViewController(VC, animated: true)
            }
        }
    override func viewDidLoad() {
        super.viewDidLoad()

        MyNewsHeadLinelbl.text = newsheadline
        MyNewsDescriptionlbl.text = newsdescription
        MyNewsContentlbl.text = newscontent
        MyNewsWebUrlbl.text = newsurl
        let url = URL(string: newspasslbl)
        self.MyNewsImagePasslbl.af.setImage(withURL: url!)


    }
    
}
