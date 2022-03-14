//
//  HelloWorldTVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-03-14.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit

class HelloWorldTVC: UITableViewCell {

    @IBOutlet weak var speakerImageBgView: UIView!
    @IBOutlet weak var speakerImageView: UIImageView!
    @IBOutlet weak var lblSpeakerName: UILabel!
    @IBOutlet weak var lblOccupation: UILabel!
    @IBOutlet weak var imageBgView: UIView!
    @IBOutlet weak var introImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
