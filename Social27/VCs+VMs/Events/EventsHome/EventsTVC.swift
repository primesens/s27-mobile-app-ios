//
//  EventsTVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-07.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class EventsTVC: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var eventImage: UIImageView!
    
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblMonth: UILabel!
    
    
    @IBOutlet weak var favouriteBtnView: UIView!
    @IBOutlet weak var btnFavourite: UIButton!
    
    @IBOutlet weak var lblEventName: UILabel!
    @IBOutlet weak var lblEventdate: UILabel!
    @IBOutlet weak var lblEventLocation: UILabel!
    
    @IBOutlet weak var registrationViewOne: UIView!
    @IBOutlet weak var registrationViewTwo: UIView!
    @IBOutlet weak var regisImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(model: Events) {
        eventImage.image = model.eventImage
        lblDate.text = model.eventDate
        lblMonth.text = model.eventMonth
        lblEventName.text = model.eventName
        lblEventdate.text = model.eventTime
        lblEventLocation.text = model.eventLocation
        
    }

    override func layoutSubviews() {
        
        bgView.addCornerRadius(radius: 9)
        bgView.addViewShadow(offSet: 2, color: UIColor.lightGray)
        eventImage.roundCorners(corners: [.bottomLeft, .bottomRight, .topLeft, .topRight], radius: 9)
        registrationViewOne.layer.cornerRadius = registrationViewOne.frame.size.width/2
        registrationViewTwo.layer.cornerRadius = registrationViewTwo.frame.size.width/2
        
        registrationViewOne.layer.borderWidth = 1
        registrationViewOne.layer.borderColor = #colorLiteral(red: 0, green: 0.4705882353, blue: 0.8431372549, alpha: 1)
        favouriteBtnView.layer.cornerRadius = favouriteBtnView.frame.size.width/2
        dateView.addCornerRadius(radius: 4)
        
        regisImage.tintColor = .white
        
        
    }
}
