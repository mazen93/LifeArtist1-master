//
//  NotificationOrders.swift
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
class NotificationOrders: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    let reacability=InternetConnection()!
    
    
    
    
    // array of label
    //  var titlee:[String]=[]
    var array:[notificationModel]=[]
    
    var v:notificationModel?
    
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  array=["facebook","twitter","uios","android"]
        
        
        
        
        
        
        
//        DispatchQueue.global(qos: .userInteractive).async {
//
//            self.loadData()
//            DispatchQueue.main.async {
//                self.collection.reloadData()
//            }
//        }
//
//
//        // scroll
//        collection.alwaysBounceVertical=true
//        view.backgroundColor = .white
//        collection.backgroundColor = .clear
        
        
        //collection.reloadData()
       createVideoArray()
        
    }
    //test
    func createVideoArray() {
//
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
        
        
        
        
        let url = URLs.oldOrder
        
        
        
        
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
                         //   let ar=notificationModel(title: " ")
//                            if let id = dataArr ["category_s_ID"].string,
//                                let service = dataArr ["secondCateg_title"].string
//                              
//                            {
////                                ar.id=id
//                               ar.service=service
////                                ar.icon=icon
//                            }
//                            
//                            
//                            
//                            
//                            self.array.append(ar)
                        }
                        
                        self.collection.reloadData()
                        
                    }
                    
                    
                }
                
                
                
                
                
                
                
                
        }
        
    }
    
    func deleteCell(cell: UICollectionViewCell) {
      
        let deletionIndexPath = collection.indexPath(for: cell)
        array.remove(at: (deletionIndexPath?.row)!)
        
       // array.removeAtIndex((deletionIndexPath?.row)!)
      //  deletionIndexPath.deleteRowsAtIndexPaths([deletionIndexPath], withRowAnimation: .Automatic)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
        
        
         let video = array[indexPath.row]
         let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "NOrdersCell", for: indexPath) as! NOrdersCell
        
        cell.setVideo(video: video)
        cell.Title.text=array[indexPath.row].service
        cell.delegate = self
        
        
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("image number \(indexPath.row)")
        v=array[indexPath.row]
//
//        print("image number \(array[indexPath.row].id)")
//        performSegue(withIdentifier: "go", sender: array[indexPath.row])
        
        
        //let vc=UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC2") as! VC2
        //  vc.firstCategoryId = array[indexPath.row].title
        //  self.present(vc, animated: true, completion: nil)
        
        
        
        
        
    }
    
}

extension NotificationOrders:orderCellDelegate {
    
    
    func didTapAccept(title: String) {
        print(title)
        print("Accept")

    }

    func didTapreject(title: String) {
        print(title)
        print("reject")
    }
    
 
    
}






extension NotificationOrders:IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "orders")
    }
}
