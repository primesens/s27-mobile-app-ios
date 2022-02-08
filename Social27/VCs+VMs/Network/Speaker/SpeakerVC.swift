//
//  SpeakerVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-10.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class SpeakerVC: UIViewController {
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var backBtnView: UIView!
    @IBOutlet weak var btnBack: UIButton!
    
    @IBOutlet weak var moreBtnView: UIView!
    @IBOutlet weak var btnMore: UIButton!
    
    @IBOutlet weak var profilePictureView: UIView!
    @IBOutlet weak var profilePictureImage: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    
    @IBOutlet weak var areaViewOne: UIView!
    @IBOutlet weak var areaViewTwo: UIView!
    @IBOutlet weak var areaViewThree: UIView!
    
    @IBOutlet weak var btnScheduleMeeting: UIButton!
    @IBOutlet weak var btnConnect: UIButton!
    @IBOutlet weak var btnChat: UIButton!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func configUI() {
        topView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 30)
        backBtnView.addCornerRadius(radius: 5)
        moreBtnView.addCornerRadius(radius: 5)
        profilePictureView.layer.cornerRadius = profilePictureView.frame.size.width/2
        profilePictureImage.layer.cornerRadius = profilePictureImage.frame.size.width/2
        
        areaViewOne.addCornerRadius(radius: 4)
        areaViewTwo.addCornerRadius(radius: 4)
        areaViewThree.addCornerRadius(radius: 4)
        
        btnScheduleMeeting.addCornerRadius(radius: 5)
        btnConnect.addCornerRadius(radius: 5)
        btnChat.addCornerRadius(radius: 5)
        
    }
    
    @IBAction func didTapOnBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func didTapOnBtnChat(_ sender: UIButton) {
        ApplicationServiceProvider.shared.pushToViewController(in: .Network, for: .ChatVC, from: self)
    }
    
    @IBAction func didTapOnBtnScheduleAMeeting(_ sender: UIButton) {
        ApplicationServiceProvider.shared.pushToViewController(in: .Network, for: .ScheduleMeetingVC, from: self)
    }
}
