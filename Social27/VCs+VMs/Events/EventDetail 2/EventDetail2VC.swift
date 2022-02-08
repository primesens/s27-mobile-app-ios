//
//  EventDetail2VC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-13.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class EventDetail2VC: UIViewController {

    @IBOutlet weak var backBtnView: UIView!
    @IBOutlet weak var favouriteBtnView: UIView!
    @IBOutlet weak var bottomView: UILabel!
    
    @IBOutlet weak var logoView: UIView!
    @IBOutlet weak var calendarView: UIView!
    
    @IBOutlet weak var btnRegister: UIButton!
    
    @IBOutlet weak var btnLinkedIn: UIButton!
    @IBOutlet weak var btnTwitter: UIButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnInstagram: UIButton!
    
    
    @IBOutlet weak var btnDescription: UIButton!
    @IBOutlet weak var btnSponsors: UIButton!
    @IBOutlet weak var btnSpeakers: UIButton!
    @IBOutlet weak var btnBooths: UIButton!
    
    
    @IBOutlet weak var speakerviewOne: UIView!
    @IBOutlet weak var speakerviewTwo: UIView!
    @IBOutlet weak var speakerViewThree: UIView!
    
    
    @IBOutlet weak var imageOne: UIImageView!
    
    @IBOutlet weak var btnS1: UIButton!
    @IBOutlet weak var btnConnect1: UIButton!
    
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var btnS2: UIButton!
    @IBOutlet weak var btnConnect2: UIButton!
    
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var btns3: UIButton!
    @IBOutlet weak var btnconnect3: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    
    func configUI() {
        backBtnView.addCornerRadius(radius: 8)
        favouriteBtnView.addCornerRadius(radius: 8)
        
        btnRegister.addCornerRadius(radius: 5)
        btnLinkedIn.layer.cornerRadius = btnLinkedIn.frame.size.width/2
        btnTwitter.layer.cornerRadius = btnLinkedIn.frame.size.width/2
        btnFacebook.layer.cornerRadius = btnLinkedIn.frame.size.width/2
        btnInstagram.layer.cornerRadius = btnLinkedIn.frame.size.width/2
        
        btnDescription.addCornerRadius(radius: 13)
        
        btnDescription.titleLabel?.font =  UIFont(name: "Poppins-Regular", size: 10)
        btnSponsors.addCornerRadius(radius: 13)
        
        btnSponsors.titleLabel?.font =  UIFont(name: "Poppins-Regular", size: 10)
        btnSpeakers.addCornerRadius(radius: 13)
        
        btnSpeakers.titleLabel?.font =  UIFont(name: "Poppins-Regular", size: 10)
        btnBooths.addCornerRadius(radius: 13)
        
        btnBooths.titleLabel?.font =  UIFont(name: "Poppins-Regular", size: 10)
        
        speakerviewOne.addCornerRadius(radius: 5)
        speakerviewOne.addViewShadow(offSet: 1, color: .lightGray)
        
        speakerviewTwo.addCornerRadius(radius: 5)
        speakerviewTwo.addViewShadow(offSet: 1, color: .lightGray)
        
        speakerViewThree.addCornerRadius(radius: 5)
        speakerViewThree.addViewShadow(offSet: 1, color: .lightGray)
        
        btnS1.addCornerRadius(radius: 5)
        btnS2.addCornerRadius(radius: 5)
        btns3.addCornerRadius(radius: 5)
        
        btnConnect1.addCornerRadius(radius: 5)
        btnConnect2.addCornerRadius(radius: 5)
        btnconnect3.addCornerRadius(radius: 5)
    }

    
}
