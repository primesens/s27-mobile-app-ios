//
//  SocialAccountTVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-02-14.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit

class SocialAccountTVC: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageBgView: UIView!
    @IBOutlet weak var socialMediaIcon: UIImageView!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    
    // MARK: - Config Cell
    
    func configCell(model: SocialAccount) {
        socialMediaIcon.image = model.SocialMediaImage
        lblEmail.text = model.email
    }

    // MARK: - Layout Subviews
    
    override func layoutSubviews() {
        imageBgView.addCornerRadius(radius: 5)
        socialMediaIcon.addCornerRadius(radius: 5)
    }

}
