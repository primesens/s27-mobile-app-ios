//
//  HappeningNowCVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-06.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class HappeningNowCVC: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var lblEventName: UILabel!
    @IBOutlet weak var lblEventDate: UILabel!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var viewFavourite: UIView!
    
    // MARK: - Config UI
    
    func configCell(model: HappeningNow) {
        eventImageView.image = model.bgImage
        lblEventName.text = model.eventName
        lblEventDate.text = model.eventTime
    }
    
    override func layoutSubviews() {
        viewBg.addCornerRadius(radius: 8)
        eventImageView.addCornerRadius(radius: 8)
        
        viewBg.addViewShadow(offSet: 2, color: UIColor.lightGray)
        
        dateView.addCornerRadius(radius: 9)
        viewFavourite.layer.cornerRadius = viewFavourite.frame.size.width/2
        bottomView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 9)
        
    }
}
