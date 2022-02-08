//
//  FeaturedScheduleCVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-27.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class FeaturedScheduleCVC: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var btnDate: UIButton!
    
    // MARK: - Config Cell
    
    func configCell(model: FeaturedSchedule) {
//        btnDate.titleLabel?.text = model.date
        btnDate.setTitle(model.date, for: .normal)
    }
    
    // MARK: - Layout Subviews
    
    override func layoutSubviews() {
        bgView.addCornerRadius(radius: 13)
        btnDate.addCornerRadius(radius: 13)
    }
}
