//
//  AttendiesCVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-02-01.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit

class AttendiesCVC: UICollectionViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    func configCell(model: Attendies) {
        imageView.image = model.attendiesImage
    }
    
    override func layoutSubviews() {
//        speakerImageView.addCornerRadius(radius: 8)
        
//        viewBg.addCornerRadius(radius: 8)
        
//        viewBg.addViewShadow(offSet: 2, color: UIColor.lightGray)
    }
}
