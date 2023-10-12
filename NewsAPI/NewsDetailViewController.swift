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


class NewsDetailViewController: UIViewController {

    @IBOutlet weak var MyNewsHeadLinelbl: UILabel!
    @IBOutlet weak var MyNewsImagePasslbl: UIImageView!
    @IBOutlet weak var MyNewsDescriptionlbl: UILabel!
    @IBOutlet weak var MyNewsContentlbl: UILabel!
    
    var newsheadline:String = " "
    var newspasslbl = ""
    var newsdescription:String = " "
    var newscontent:String = " "

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyNewsHeadLinelbl.text = newsheadline
        MyNewsDescriptionlbl.text = newsdescription
        MyNewsContentlbl.text = newscontent
        
        let urll = URL(string: newspasslbl)
        self.MyNewsImagePasslbl.af.setImage(withURL: urll!)


    }
    
}
