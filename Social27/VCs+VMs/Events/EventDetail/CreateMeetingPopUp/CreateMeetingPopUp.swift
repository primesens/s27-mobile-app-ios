//
//  CreateMeetingPopUp.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-29.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

protocol CreateMeetingPopUpDelegate {
    func btnOtherMeeting(action: String)
}

class CreateMeetingPopUp: UIView {

    // MARK: - Variables
    
    static let instance = CreateMeetingPopUp()
    var delegate: CreateMeetingPopUpDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var providerBtnOne: UIButton!
    @IBOutlet weak var providerBtnTwo: UIButton!
    @IBOutlet weak var providerBtnThree: UIButton!
    @IBOutlet weak var providerBtnFour: UIButton!
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CreateMeetingPopUp", owner: self, options: nil)
        commomInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commomInit() {
        
        // Parentview Properties
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        popUpView.addCornerRadius(radius: 10)
    }
    
    // MARK: - Show  view
    
    func showCreateMeetingView(from vc: UIViewController) {
        self.delegate = vc as? CreateMeetingPopUpDelegate
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func didTapOnBtnClose(_ sender: UIButton) {
        parentView.removeFromSuperview()
    }
    
    @IBAction func didTapOnOtherBtn(_ sender: UIButton, from vc: UIViewController) {
        delegate?.btnOtherMeeting(action: sender.title(for: .normal) ?? "Other")
        parentView.removeFromSuperview()
    }
}
