//
//  FeedsVC.swift
//  G_Feeds
//
//  Created by Azharuddin Mohammad on 07/02/19.
//  Copyright © 2019 NadboyTechnolgiesPvt.Ltd. All rights reserved.
//

import UIKit

class FeedsVC: UIViewController {
    enum JSONError: String,Error {
        case NoData = "ERROR: no data"
        case ConversionFailed = "ERROR: conversion from JSON failed"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        //getFeeds()
        var helloWorldTimer = Timer.scheduledTimer(timeInterval: 300.0, target: self, selector: #selector(self.getFeeds), userInfo: nil, repeats: true)
  
        // Do any additional setup after loading the view.
    }
  @objc  func getFeeds(){
        let urlPath = "https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=b1cbe92a603e41058bc0b567551343c3"
    guard let endpoint = NSURL(string: urlPath) else {
            print("error occured in endpoint")
            return
        }
        let request = URLRequest(url: endpoint as URL)
        URLSession.shared.dataTask(with: request ) { (data, response, error) in
            do {
                guard let json = try JSONSerialization.jsonObject(with: data!, options:[]) as? NSDictionary else{
                throw JSONError.ConversionFailed
                    
            }
                print(json)
                let data:NSArray = json["articles"] as! NSArray
                print(data)
                for feed in data {
                    print(feed)
                    print("new")
                }
                
            }
            catch let error as JSONError {
                print(error.rawValue)
            } catch let error as NSError {
                print(error.debugDescription)
            }
        }.resume()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   

}
