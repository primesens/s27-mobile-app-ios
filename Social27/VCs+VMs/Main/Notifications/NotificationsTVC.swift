//
//  NotificationsTVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-13.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class NotificationsTVC: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var innerCellBgView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var lblNotificationTitle: UILabel!
    @IBOutlet weak var lblNotificationSubtitle: UILabel!
    @IBOutlet weak var lblNotificationMessage: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configCell(model: Notifications) {
        if model.innerCellColor == "#F3F8FC" {
            innerCellBgView.backgroundColor = #colorLiteral(red: 0.9529411765, green: 0.9725490196, blue: 0.9882352941, alpha: 1)
        } else {
            innerCellBgView.backgroundColor = UIColor.white
        }
        
        if model.statusView == "Show" {
            statusView.isHidden = false
        } else {
            statusView.isHidden = true
        }
        notificationImageView.image = model.notificationImageView
        lblNotificationTitle.text = model.notificationTitle
        lblNotificationSubtitle.text = model.notificationSubTitle
        lblNotificationMessage.text = model.notificationMessage
        lblTime.text = model.notificationTime
        
    }

    override func layoutSubviews() {
        notificationImageView.layer.cornerRadius = notificationImageView.frame.size.width/2
        
        
    }
}
