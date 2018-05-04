//
//  NOrdersCell.swift
//  LifeARtistTest
//
//  Created by mohamed on 4/14/18.
//  Copyright © 2018 Mohamed ELfishawy. All rights reserved.
//

import UIKit


protocol orderCellDelegate {
    func didTapAccept(title: String)
     func didTapreject(title: String)
}


class NOrdersCell: UICollectionViewCell {
   
    var videoItem: notificationModel!
    var delegate:orderCellDelegate?
    
     @IBOutlet weak var Title: UILabel!
    
    func setVideo(video: notificationModel) {
        videoItem = video
        Title.text = video.service
    }
    
    @IBAction func acceptButton(_ sender: Any) {
        delegate?.didTapAccept(title: videoItem.service)
       
        
    }
    @IBAction func rejectButton(_ sender: Any) {
        delegate?.didTapreject(title:  videoItem.service )
    }
}






