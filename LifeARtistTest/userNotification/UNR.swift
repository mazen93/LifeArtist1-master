//
//  UNR.swift
//  LifeARtistTest
//
//  Created by mohamed on 4/25/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import Cosmos
class UNR: UITableViewCell {

    @IBOutlet var cosmosView: CosmosView!
    @IBOutlet weak var id: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func update(_ rating: Double) {
        cosmosView.rating = rating
       // id.text=String(rating)
        
    }

}
