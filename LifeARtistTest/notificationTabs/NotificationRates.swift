//
//  NotificationRates.swift
//  LifeARtistTest
//
//  Created by mohamed on 4/14/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Foundation
import FoldingCell
import Alamofire
import SwiftyJSON
import Kingfisher

class NotificationRates: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UISearchBarDelegate{
    
    
    let reacability=InternetConnection()!
    
  
    
    
    var array:[notificationModel]=[]
    var v:notificationModel?
    
    @IBOutlet weak var collection: UICollectionView!
    

    private static var rowsCount = 10
    private var ratingStorage = [Double](repeating: 0, count: rowsCount)
    
    
    
    //test
    func createVideoArray() {
        
//        let video1 = notificationModel(title: "Facebook Interview 3")
//        let video2 = notificationModel(title: "iOS Podcasts")
//        let video3 = notificationModel(title: "UIButton Animations")
//        let video4 = notificationModel(title: "Sort Array by Value")
//        let video5 = notificationModel(title: "UIPickerView Tutorial")
//        let video6 = notificationModel(title: "Swift or Objective-C?")
//
//
//
//
//
//
//        array.append(video1)
//        array.append(video2)
//        array.append(video3)
//        array.append(video4)
//        array.append(video5)
//        array.append(video6)
    }
    
    
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
 
//
//    DispatchQueue.global(qos: .userInteractive).async {
//
//    self.loadData()
//    DispatchQueue.main.async {
//    self.collection.reloadData()
//    }
//    }
//
//
//    // scroll
//    collection.alwaysBounceVertical=true
//    view.backgroundColor = .white
//    collection.backgroundColor = .clear
//
    
    //collection.reloadData()
    
       createVideoArray()
        
  
    }
    @objc func reachabilityChanged(note: Notification) {
    
    let reachability = note.object as! InternetConnection
    
    switch reachability.connection {
    case .wifi:
    print("Reachable via WiFi")
    case .cellular:
    print("Reachable via Cellular")
    case .none:
    print("Network not reachable")
    }
    }

   
    
   
    
    
   
    
    
    func loadData()  {
    

    
    
    let url = URLs.login
    
    
    
    
    Alamofire.request(url, method: .get, encoding: URLEncoding.default, headers: nil)
    .responseJSON { response in
    
    switch response.result
    {
    case .failure(let error):
    
    print(error)
    
    case .success(let value):
    self.array=[notificationModel]()
    
    let json = JSON(value)
    // print(json)
    
    if let dataArr = json["second_category"].array
    {
    
    
    
    for dataArr in dataArr {
//        let ar=notificationModel(title: " ")
//    if let id = dataArr ["category_s_ID"].string,
//    let titl = dataArr ["secondCateg_title"].string,
//    let icon = dataArr ["secCategory_icon"].string
//              {
////            ar.id=id
////            ar.title=titl
////               ar.icon=icon
//             }
//
//
//
//
//    self.array.append(ar)
             }
    
    self.collection.reloadData()
    
    }
    
    
    }
    
    
    
    
    
    
    
    
    }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    // MyCollectionViewCell
    
    let cell:NRatesCell=collectionView.dequeueReusableCell(withReuseIdentifier: "NRatesCell", for: indexPath) as! NRatesCell
    
            // Get the rating for the star
            let rating = ratingStorage[indexPath.row]
            
            // Update star's rating
            cell.update(rating)
        
        cell.cosmosView.didTouchCosmos={[weak self] rating in
            cell.id.text=String(rating)
            
            
        }
    
        
            // Store the star's rating when user lifts her finger
            cell.cosmosView.didFinishTouchingCosmos = { [weak self] rating in
                self?.ratingStorage[indexPath.row] = rating
                cell.Title.text=String(rating)
               
        }
            
            return cell

    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print("image number \(indexPath.row)")
    v=array[indexPath.row]
    
//    print("image number \(array[indexPath.row].id)")
//    performSegue(withIdentifier: "go", sender: array[indexPath.row])
    
    
    //let vc=UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC2") as! VC2
    //  vc.firstCategoryId = array[indexPath.row].title
    //  self.present(vc, animated: true, completion: nil)
    
        
      
    
    
    
    
    }
    
    }


extension NotificationRates:IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "rate")
    }
}
