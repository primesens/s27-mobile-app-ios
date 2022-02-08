//
//  LiveChatVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-20.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class LiveChatVC: UIViewController {

    @IBOutlet weak var liveVideoView: UIView!
    @IBOutlet weak var btnsView: UIView!
    @IBOutlet weak var viewBtnSend: UIView!
    @IBOutlet weak var btnClose: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func configUI() {
        btnsView.addBottomShadow()
        viewBtnSend.addCornerRadius(radius: 6)
        btnClose.addCornerRadius(radius: 6)
        bottomView.addViewShadow(offSet: 1, color: .lightGray)
    }
    
    @IBAction func didTapOnclose(_ sender: UIButton) {
        EventSurvey.instance.showEventSurveyView(from: self)
    }
    
    @IBAction func didTapOnPolls(_ sender: UIButton) {
        ApplicationServiceProvider.shared.pushToViewController(in: .Events, for: .PollVC, from: self)
    }
}

extension LiveChatVC: EventSurveyDelegate {
    func btnComplete(action: String) {
        SurveySuccess.instance.showSurveySuccessView(from: self)
    }
}

extension LiveChatVC: SurveySuccessDelegate {
    func btnContinue(action: String) {
        ApplicationServiceProvider.shared.resetWindow(in: .Tabbar, for: .MainTBC, from: self)
    }
}
