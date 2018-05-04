//
//  notificationTabVC.swift
//  LifeARtistTest
//
//  Created by mohamed on 4/14/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import Foundation
class notificationTabVC: ButtonBarPagerTabStripViewController{
    
        let blueInstagramColor = UIColor(red: 37/255.0, green: 111/255.0, blue: 206/255.0, alpha: 1.0)
    
        override func viewDidLoad() {
           
            // change selected bar color
            settings.style.buttonBarBackgroundColor = .white
            settings.style.buttonBarItemBackgroundColor = .white
            settings.style.selectedBarBackgroundColor = blueInstagramColor
            settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
            settings.style.selectedBarHeight = 2.0
            settings.style.buttonBarMinimumLineSpacing = 0
            settings.style.buttonBarItemTitleColor = .black
            settings.style.buttonBarItemsShouldFillAvailableWidth = true
            settings.style.buttonBarLeftContentInset = 0
            settings.style.buttonBarRightContentInset = 0
            
            changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
                guard changeCurrentIndex == true else { return }
                oldCell?.label.textColor = .black
                newCell?.label.textColor = self?.blueInstagramColor
            }
            super.viewDidLoad()
            
        }
        
   
        override  func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
            
            let orders=UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NotificationOrders") as! NotificationOrders
          
            let rates=UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NotificationRates") as! NotificationRates
           
            
            return [orders, rates]
        }
        
        
        
        
}

