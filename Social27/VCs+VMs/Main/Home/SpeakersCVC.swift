//
//  SpeakersCVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-06.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class SpeakersCVC: UICollectionViewCell {
    
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var speakerImageView: UIImageView!
    
    func configCell(model: Speakers) {
        speakerImageView.image = model.speakerImage
    }
    
    override func layoutSubviews() {
        speakerImageView.addCornerRadius(radius: 8)
        
        viewBg.addCornerRadius(radius: 8)
        
//        viewBg.addViewShadow(offSet: 2, color: UIColor.lightGray)
    }
}
