//
//  EventNetworkingTVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-27.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class EventNetworkingTVC: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var bgView             : UIView!
    @IBOutlet weak var speakerImage       : UIImageView!
    @IBOutlet weak var lblName            : UILabel!
    @IBOutlet weak var lblPosition        : UILabel!
    @IBOutlet weak var btnScheduleMeeting : UIButton!
    @IBOutlet weak var btnConnect         : UIButton!
    
    // MARK: - Config Cell
    
    func configCell(model: EventNetworking) {
        speakerImage.image = model.speakerImage
        lblName.text = model.name
        lblPosition.text = model.position
    }

    // MARK: - Layout Subviews
    
    override func layoutSubviews() {
        bgView.addViewShadow(offSet: 0.5, color: #colorLiteral(red: 0.9033967257, green: 0.9416242242, blue: 0.9847564101, alpha: 1) )
        bgView.addCornerRadius(radius: 6)
        
        speakerImage.layer.cornerRadius = speakerImage.frame.size.width/2
        btnScheduleMeeting.addCornerRadius(radius: 5)
        btnConnect.addCornerRadius(radius: 5)
    }

}
