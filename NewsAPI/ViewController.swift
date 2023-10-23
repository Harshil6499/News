//
//  ViewController.swift
//  NewsAPI
//
//  Created by Apple on 14/08/23.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    
    
    @IBOutlet weak var MyNewsTableView: UITableView!
    
    var my_arr_news = [String]()
    var my_arr_date = [String]()
    var my_arr_image = [String]()
    var my_arr_title = [String]()
    var my_arr_content = [String]()
    var my_arr_description = [String]()
    var my_arr_url = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NEWS_API()

        self.MyNewsTableView.dataSource = self
        self.MyNewsTableView.delegate = self
        
        //self.MyNewsTableView.reloadData()
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return my_arr_news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as! MyTableViewCell
        cell.MyNewsLBL.text = my_arr_news[indexPath.row]
        cell.MyNewsDateLBL.text = my_arr_date[indexPath.row]
        cell.MyNewsContentLBL.text = my_arr_title[indexPath.row]
        
        let url = URL(string: my_arr_image[indexPath.row])
        //print("............")
        
        cell.MyNewsImageView.af.setImage(withURL: url!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        275
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let main = storyboard?.instantiateViewController(identifier: "NewsDetailViewController") as! NewsDetailViewController
        main.newsheadline = my_arr_title[indexPath.row]
        main.newscontent = my_arr_description[indexPath.row]
        main.newsdescription = my_arr_content[indexPath.row]
        main.newspasslbl = my_arr_image[indexPath.row]
        main.newsurl = my_arr_url[indexPath.row]
        
        //self.present(main,animated: true)
        self.navigationController?.pushViewController(main, animated: true)
        
    }
    
     //API CALLING__________________
    
    func NEWS_API () {
        
        let NEWS_API_URL = "https://newsapi.org/v2/everything?q=apple&from=2023-10-11&to=2023-10-11&sortBy=popularity&apiKey=45325568f0c64e11a47838b9697fdb17"

        
        AF.request(NEWS_API_URL).responseJSON{(response) in
            switch response.result{
                
            case .success:
                
                let mydata = try? JSON (data: response.data!)
                let my_data = mydata!["articles"]
                
                self.my_arr_news.removeAll()
                self.my_arr_date.removeAll()
                self.my_arr_image.removeAll()
                self.my_arr_content.removeAll()
                self.my_arr_url.removeAll()
                
                
                for i in my_data.arrayValue{
                    
                    let news = i["author"].stringValue
                    self.my_arr_news.append(news)
                    
                    let title = i["title"].stringValue
                    self.my_arr_title.append(title)
                    
                    let publishedAt = i["publishedAt"].stringValue
                    self.my_arr_date.append(publishedAt)
                    
                    let urlToImage = i["urlToImage"].stringValue
                    self.my_arr_image.append(urlToImage)
                    
                    let description = i["description"].stringValue
                    self.my_arr_description.append(description)
                    
                    let content = i["content"].stringValue
                    self.my_arr_content.append(content)
                    
                    let url = i["url"].stringValue
                    self.my_arr_url.append(url)
                    
                    print(content)
                    print(title)
                    print(urlToImage)
                    print(publishedAt)
                    print(title)
                    print(news)
                    print(url)
                    
                }
                self.MyNewsTableView.reloadData()
                break
            case .failure:
                break
            }
        }
        
    }

}

