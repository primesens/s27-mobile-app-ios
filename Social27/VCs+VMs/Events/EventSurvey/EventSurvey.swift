//
//  EventSurvey.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-30.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

protocol EventSurveyDelegate {
    func btnComplete(action: String)
}

class EventSurvey: UIView {
    
    // MARK: - Variables
    
    static let instance = EventSurvey()
    var delegate: EventSurveyDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var popUpInnerView: UIView!
    @IBOutlet weak var questionViewOne: UIView!
    @IBOutlet weak var questionViewTwo: UIView!
    @IBOutlet weak var questionViewThree: UIView!
    @IBOutlet weak var questionViewFour: UIView!
    
    @IBOutlet weak var feedbackTF: UITextField!
    @IBOutlet weak var btnComplete: UIButton!
    
    @IBOutlet weak var ratingBtn1: UIButton!
    @IBOutlet weak var ratingBtn2: UIButton!
    @IBOutlet weak var ratingBtn3: UIButton!
    @IBOutlet weak var ratingBtn4: UIButton!
    @IBOutlet weak var ratingBtn5: UIButton!
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("EventSurvey", owner: self, options: nil)
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
        popUpInnerView.addCornerRadius(radius: 10)
        
        questionViewOne.addCornerRadius(radius: 9)
        questionViewTwo.addCornerRadius(radius: 9)
        questionViewThree.addCornerRadius(radius: 9)
        questionViewFour.addCornerRadius(radius: 9)
        
        feedbackTF.layer.borderColor = UIColor.black.cgColor
        feedbackTF.layer.borderWidth = 0.5
        feedbackTF.layer.cornerRadius = 5
        btnComplete.addCornerRadius(radius: 5)
        
        ratingBtn1.addCornerRadius(radius: 4)
        ratingBtn1.layer.borderColor = UIColor.lightGray.cgColor
        ratingBtn1.layer.borderWidth = 1
        
        ratingBtn2.addCornerRadius(radius: 4)
        ratingBtn2.layer.borderColor = UIColor.lightGray.cgColor
        ratingBtn2.layer.borderWidth = 1
        
        ratingBtn3.addCornerRadius(radius: 4)
        ratingBtn3.layer.borderColor = UIColor.lightGray.cgColor
        ratingBtn3.layer.borderWidth = 1
        
        ratingBtn4.addCornerRadius(radius: 4)
        ratingBtn4.layer.borderColor = UIColor.lightGray.cgColor
        ratingBtn4.layer.borderWidth = 1
        
        ratingBtn5.addCornerRadius(radius: 4)
        ratingBtn5.layer.borderColor = UIColor.lightGray.cgColor
        ratingBtn5.layer.borderWidth = 1
    }
    
    func showEventSurveyView(from vc: UIViewController) {
        self.delegate = vc as? EventSurveyDelegate
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func didTapOnBtnClose(_ sender: UIButton) {
        parentView.removeFromSuperview()
    }
    
    @IBAction func didTapOnBtnComplete(_ sender: UIButton) {
        delegate?.btnComplete(action: sender.title(for: .normal) ?? "Complete")
        parentView.removeFromSuperview()
    }
}
