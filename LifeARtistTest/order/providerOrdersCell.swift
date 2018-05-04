//
//  providerOrdersCell.swift
//  LifeARtistTest
//
//  Created by mohamed on 5/2/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit

protocol providerOrdersCellDelegate {
    func didTapMore(title: String)
   
}



class providerOrdersCell: UITableViewCell {
    
    var Item: showData!
    var delegate:providerOrdersCellDelegate?
  
    
    
    @IBAction func moreButton(_ sender: Any) {
        delegate?.didTapMore(title: Item.providerId)
    }
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var total: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
