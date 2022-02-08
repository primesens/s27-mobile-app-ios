//
//  EventSponsorsCVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-27.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class EventSponsorsCVC: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var sponsorsBgView   : UIView!
    @IBOutlet weak var sponsorsImageView: UIImageView!
    
    // MARK: - Config Cell
    
    func configCell(model: EventSponsors) {
        sponsorsImageView.image = model.sponsorImage
    }
    
    // MARK: - Layout Subviews
    
    override func layoutSubviews() {
        sponsorsBgView.addShadow(offSet: 1, color: .lightGray)
        sponsorsBgView.addCornerRadius(radius: 10)
    }
}
