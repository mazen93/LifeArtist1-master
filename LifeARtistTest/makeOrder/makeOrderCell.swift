//
//  makeOrderCell.swift
//  LifeARtistTest
//
//  Created by mohamed on 4/21/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit
import BEMCheckBox
class makeOrderCell: UITableViewCell {
    @IBOutlet weak var service: UILabel!
    @IBOutlet weak var prize: UILabel!
    @IBOutlet weak var check: BEMCheckBox!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
