//
//  SponsorsCVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-06.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class SponsorsCVC: UICollectionViewCell { 
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var sponsorImageView: UIImageView!
    
    func configCell(model: Sponsors) {
        sponsorImageView.image = model.sponsorImage
    }
    
    override func layoutSubviews() {
        sponsorImageView.addCornerRadius(radius: 10)
    }
}
