//
//  AttendiesCVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-02-01.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit
import AVKit

class AttendiesCVC: UICollectionViewCell {
    
    // MARK: - Variables
    
    var player          : AVPlayer?
    var avpController   = AVPlayerViewController()
    
    // MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
//    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var playerimageView: UIImageView!
    
    // MARK: - LifeCycle
    
    func configCell(model: Attendies) {
        playerimageView.image = model.attendiesImage
    }
    
    override func layoutSubviews() {
//        speakerImageView.addCornerRadius(radius: 8)
        
//        viewBg.addCornerRadius(radius: 8)
        
//        viewBg.addViewShadow(offSet: 2, color: UIColor.lightGray)
    }
    
}
