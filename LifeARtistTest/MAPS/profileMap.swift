//
//  profileMap.swift
//  LifeARtistTest
//
//  Created by mohamed on 4/24/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import Foundation

import MapKit
import AddressBook
import SwiftyJSON

class profileMap: NSObject, MKAnnotation
{
    let name: String?
    let rate: String?
    let icon:String?
    let coordinate: CLLocationCoordinate2D
   
    
    init(name: String, rate: String?,icon: String, coordinate: CLLocationCoordinate2D)
    {
        self.name = name
        self.rate = rate
        self.coordinate = coordinate
        self.icon=icon
        super.init()
    }
    
    var subtitle: String? {
        return name
    }

    class func from(json: JSON) -> profileMap?
    {
        var name: String
        if let nname = json["name"].string {
            name = nname
        } else {
            name = ""
        }
        // tesssttt
        var rate: String
        if let rrate = json["rate"].string {
            rate = rrate
        } else {
            rate = ""
        }
        
        
        
        
        
        let icon = json["location"]["address"].string
        let lat = json["location"]["lat"].doubleValue
        let long = json["location"]["lng"].doubleValue
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
   
    
        return profileMap(name: name, rate: rate, icon: icon!, coordinate: coordinate)
    }
    
    
    
    func mapItem() -> MKMapItem
    {
        let addressDictionary = [String(kABPersonAddressStreetKey) : subtitle]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDictionary)
        let mapItem = MKMapItem(placemark: placemark)
        
        mapItem.name = "\(name) \(rate)\(icon)"
        
        return mapItem
    }
}











