//
//  userNotificationVC.swift
//  LifeARtistTest
//
//  Created by mohamed on 4/25/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class userNotificationVC: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
    /*
   
    `{"notifications":
    [{"id":7,
     "text":"Service has been canceled by eng ezzzzz",
     "text_ar":"\u062a\u0645 \u0631\u0641\u0636 \u0627\u0644\u062e\u062f\u0645\u0629 \u0645\u0646 \u0642\u0628\u0644eng ezzzzz",
     "type":"1",
     "user_id":"3",
     "order_id":"6",
     "rate_id":"1",
     "provider_id":"52",
     "created_at":"2018-01-20 18:05:29",
     "updated_at":"2018-01-20 18:05:29"},
     {"id":13,
     "text":"Your service has been approved by eng ezzzzz",
     "text_ar":"\u062a\u0645 \u0627\u0644\u0645\u0648\u0627\u0641\u0642\u0629 \u0639\u0644\u064a \u062e\u062f\u0645\u062a\u0643 \u0645\u0646 eng ezzzzz","type":"2","user_id":"3","order_id":"6","rate_id":"1","provider_id":"52","created_at":"2018-01-20 19:10:17","updated_at":"2018-01-20 19:10:17"},
     {"id":15,"text":"Your service has been approved by eng ezzzzz","text_ar":"\u062a\u0645 \u0627\u0644\u0645\u0648\u0627\u0641\u0642\u0629 \u0639\u0644\u064a \u062e\u062f\u0645\u062a\u0643 \u0645\u0646 eng ezzzzz","type":"1","user_id":"3","order_id":"8","rate_id":"1","provider_id":"52","created_at":"2018-01-21 18:28:58","updated_at":"2018-01-21 18:28:58"}]}

    
    */
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableview2: UITableView!
  var array:[userNotificationModel]=[]
   var arrayRate:[userNotificationModel]=[]
    
    

    let houseData = ["Arryn", "Baratheon", "Greyjoy", "Lannister", "Martell", "Stark", "Targaryen", "Tully", "Tyrell"]



    let wordsData = ["As high as honor", "Ours is the fury", "We do not sow", "Hear me roar", "Unbowed, unbent, unbroken", "Winter is coming", "fire and blood", "Family, duty, honor", "Growing strong"]
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.dataSource = self
        tableView.delegate = self
        tableview2.delegate=self
        tableview2.dataSource=self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
//        var count:Int?
//
//        if tableView == self.tableView {
//            count = houseData.count
//        }
//
//        if tableView == self.tableview2 {
//            count =  wordsData.count
//        }
//
//        return count!
  
        if(tableView == self.tableView){
            
         //   return arrayRate.count
            
            return houseData.count
            
        }
        else{
            return wordsData.count
            
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        if (indexPath.row % 2) == 0{
//
//
//           let  cell = tableView.dequeueReusableCell(withIdentifier: "UNR", for: indexPath) as! UNR
//            cell.id.text=wordsData[indexPath.item]
//          return cell
//        }
//        else{
//           let  cell = tableView.dequeueReusableCell(withIdentifier: "UNL", for: indexPath) as! UNL
//            cell.Title.text=houseData[indexPath.item]
//          return cell
//        }
     
        if(tableView == self.tableView){
            
            let  cell = tableView.dequeueReusableCell(withIdentifier: "UNR", for: indexPath) as! UNR
                      cell.id.text=houseData[indexPath.row]
            
            
          
            
            
            
            // Store the star's rating when user lifts her finger
            cell.cosmosView.didFinishTouchingCosmos = { [weak self] rating in
                
                cell.id.text=String(rating)
                self?.addRate(rate:rating,id:(self?.houseData[indexPath.row])!)
                
            }
            
                   return cell
            
        }
        else{
            let  cell = tableView.dequeueReusableCell(withIdentifier: "UNL", for: indexPath) as! UNL
                     cell.Title.text=wordsData[indexPath.row]
          
            return cell
            
        }
        
        
        
        
        
        
    }
    
    
    func addRate(rate:Double,id:String)  {
        print(rate)
        print(id)
        
        
        /*
        rate 3
        provider_id 13
        user_id 11
        */
        
        
        
        
        
        let url = "http://live-artists.com/admin/api/add/rate"
        
        let parameters = [
            
         
            "rate": "rate",
            "provider_id": "price",
            "user_id": "serviceId"
            
        ]
        
        
        Alamofire.request(url, method: .post,parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    
                    print(error)
                    
                case .success(let value):
                    self.array=[userNotificationModel]()
                    
                    let json = JSON(value)
                    print(json)
                    
                    
                    
                    /*
 
                     `{"rateResponse":
                     {"rate":"3","user_id":"11","provider_id":"13","updated_at":"2018-02-07 12:58:02","created_at":"2018-02-07 12:58:02","id":8,
                     "user":
                     {"id":11,"firstName":"bahamovic","lastName":"lashin","fullName":"bahamovic lashin","email":"bullet@gmail.com","phone":"01060060097","active":"1","type_id":"3","password":"$2y$10$E7PBxBVPXsZHjabcOFvSdOUJCowMaoq7JXuTZonWjhhHHLtyXJ14S","created_at":"2018-01-18 10:08:28","updated_at":"2018-02-06 16:19:40"}}}

                    */
                    
                    
                    
                    
                    
                  
                    
                    
                }
                
                
                
                
                
                
        }
        
        
        
        
    }
    

    
    
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = DetailVC()
//        vc.commonInit("got_bg_\(indexPath.item)", title: houseData[indexPath.item])
//        self.navigationController?.pushViewController(vc, animated: true)
//        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func loadData()  {
        
        //let url = URLs.oldOrder
        
        
        
        
       // let userID=UserDefaults.standard.string(forKey: "userId")
        
        let userID=3
        
        let url = "http://live-artists.com/admin/api/show/user/notific/\(userID)"
        
        
        
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    
                    print(error)
                    
                case .success(let value):
                    self.array=[userNotificationModel]()
                    
                    let json = JSON(value)
                    print(json)
                    
                    if let dataArr = json["notifications"].array
                    {
                        
                        for dataArr in dataArr {
                            let ar=userNotificationModel()
                                if let providerId = dataArr ["provider_id"].string,
                                    let text = dataArr ["text"].string
                                {
                                    
                                    ar.providerId=providerId
                                    ar.text=text
                                 
                                }
                            
                            
                            self.array.append(ar)
                        }
                        
                        self.tableview2.reloadData()
                        
                    }
                    
                    
                }
                
                
                
                
                
                
        }
        
    }
    func loadRateData()  {
        
        //let url = URLs.oldOrder
        
        
        // let userID=UserDefaults.standard.string(forKey: "userId")
        
      /*
        `{"rateResponse":{
         "rate":"3",
         "user_id":"11",
         "provider_id":"13","updated_at":"2018-02-07 12:58:02","created_at":"2018-02-07 12:58:02",
         "id":8,
         "user":{"id":11,"firstName":"bahamovic","lastName":"lashin","fullName":"bahamovic lashin","email":"bullet@gmail.com","phone":"01060060097","active":"1","type_id":"3","password":"$2y$10$E7PBxBVPXsZHjabcOFvSdOUJCowMaoq7JXuTZonWjhhHHLtyXJ14S","created_at":"2018-01-18 10:08:28","updated_at":"2018-02-06 16:19:40"}}}

        
        */
        
        
        let userID=3
        
        let url = "http://live-artists.com/admin/api/show/user/notific/\(userID)"
        
        
        
        
        Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
            .responseJSON { response in
                
                switch response.result
                {
                case .failure(let error):
                    
                    print(error)
                    
                case .success(let value):
                    self.array=[userNotificationModel]()
                    
                    let json = JSON(value)
                    print(json)
                    
                    if let dataArr = json["orders"].array
                    {
                        
                        for dataArr in dataArr {
                            let ar=userNotificationModel()
                                if let providerId = dataArr ["provider_id"].string,
                                    let text = dataArr ["text"].string
                                {
                                    
                                    ar.providerId=providerId
                                    ar.text=text
                                    
                                }
                            
                            self.arrayRate.append(ar)
                        }
                        
                        self.tableView.reloadData()
                        
                    }
                    
                    
                }
                
                
                
                
                
                
        }
        
    }
    
    

}
