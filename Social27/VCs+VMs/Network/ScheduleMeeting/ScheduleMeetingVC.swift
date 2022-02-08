//
//  ScheduleMeetingVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-20.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class ScheduleMeetingVC: UIViewController {

    @IBOutlet weak var backBtnView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var btnCreateMeeting: UIButton!
    @IBOutlet weak var topShadowView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func configUI() {
        backBtnView.addViewShadow(offSet: 1, color: .lightGray)
        backBtnView.addCornerRadius(radius: 5)
        topShadowView.addBottomShadow()
        bottomView.addViewShadow(offSet: 0.5, color: .lightGray)
        btnCreateMeeting.addCornerRadius(radius: 4)
    }
    
    @IBAction func didTapOnBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
