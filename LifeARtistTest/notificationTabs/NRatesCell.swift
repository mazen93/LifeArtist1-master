//
//  NRatesCell.swift
//  LifeARtistTest
//
//  Created by mohamed on 4/14/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import Cosmos



class NRatesCell: UICollectionViewCell {
    @IBOutlet var cosmosView: CosmosView!
     @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var id: UILabel!
    func update(_ rating: Double) {
        cosmosView.rating = rating
        Title.text=String(rating)
    
    }
    
    override public func prepareForReuse() {
        // Ensures the reused cosmos view is as good as new
        cosmosView.prepareForReuse()
    }
    
}
