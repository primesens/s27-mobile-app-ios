//
//  AttendeesCVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-06.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class AttendeesCVC: UICollectionViewCell {
    
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var networkImageView: UIImageView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var lblName: UILabel!
    
    func configCell(model: Network) {
        networkImageView.image = model.bgImage
        lblName.text = model.name
    }
    
    override func layoutSubviews() {
        
        
        viewBg.addCornerRadius(radius: 9)
        delay(0.1) {
            self.nameView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 9)
        }
        
        
    }
}
