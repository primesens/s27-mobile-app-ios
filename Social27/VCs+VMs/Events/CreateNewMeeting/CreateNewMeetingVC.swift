//
//  CreateNewMeetingVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-29.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class CreateNewMeetingVC: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btnBackView: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var topicTF: UITextField!
    @IBOutlet weak var lblTopicRemainingLetters: UILabel!
    @IBOutlet weak var descriptionTF: UITextField!
    @IBOutlet weak var lblDescriptionRemainingLetters: UILabel!
    @IBOutlet weak var areaOfInterestTF: UITextField!
    @IBOutlet weak var timeZoneTF: UITextField!
    @IBOutlet weak var chooseDateTF: UITextField!
    @IBOutlet weak var durationTF: UITextField!
    @IBOutlet weak var chooseTimeTF: UITextField!
    @IBOutlet weak var lblInviteCount: UILabel!
    @IBOutlet weak var btnInviteAttende: UIButton!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var btnRegister: UIButton!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let height: CGFloat = 80 //whatever height you want to add to the existing height
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func configUI() {
        btnBackView.addCornerRadius(radius: 4)
        btnBackView.addViewShadow(offSet: 0.5, color: .lightGray)
        btnInviteAttende.addCornerRadius(radius: 4)
        btnRegister.addCornerRadius(radius: 4)
        topView.addBottomShadow()
        bottomView.addViewShadow(offSet: -5, color: .lightGray)
//        bottomView.addTopShadow(shadowColor: .lightGray, offset: -5)
        topicTF.textFieldBoarderOne()
        descriptionTF.textFieldBoarderOne()
        areaOfInterestTF.textFieldBoarderOne()
        timeZoneTF.textFieldBoarderOne()
        chooseDateTF.textFieldBoarderOne()
        durationTF.textFieldBoarderOne()
        chooseTimeTF.textFieldBoarderOne()
        
    }
    
    // MARK: - Outlet Action
    @IBAction func didTapOnBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
