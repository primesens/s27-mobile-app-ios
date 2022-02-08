//
//  NetworlHelloWorldTVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-02-08.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit

class NetworlHelloWorldTVC: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var bgview: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var btnSound: UIButton!
    @IBOutlet weak var speakerImageBgView: UIView!
    @IBOutlet weak var speakerImageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblOccupation: UILabel!
    
    
    // MARK: - Config Cell
    
    func configCell(model: HelloWorldSpeakers) {
        speakerImageView.image = model.speakerImage
        lblName.text = model.name
        lblOccupation.text = model.position
    }
    
  
    // MARK: - Layout Subviews
    override func layoutSubviews() {
        
        bgview.layer.cornerRadius = 8
        topView.roundCorners(corners: [.topLeft, .topRight], radius: 9)
        videoView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 9)
        speakerImageBgView.layer.cornerRadius = speakerImageBgView.frame.size.width/2
        speakerImageView.layer.cornerRadius = speakerImageView.frame.size.width/2
        btnSound.layer.cornerRadius = btnSound.frame.size.width/2
    }

}
