//
//  SurveySuccess.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-30.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

protocol SurveySuccessDelegate {
    func btnContinue(action: String)
}

class SurveySuccess: UIView {

    // MARK: - Variables
    
    static let instance = SurveySuccess()
    var delegate: SurveySuccessDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var lblSurveyTitle: UILabel!
    @IBOutlet weak var btnContinue: UIButton!
    
    // MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("SurveySuccess", owner: self, options: nil)
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
        btnContinue.addCornerRadius(radius: 4)
    }
    
    // MARK: - Show  view
    
    func showSurveySuccessView(from vc: UIViewController) {
        self.delegate = vc as? SurveySuccessDelegate
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    @IBAction func didTapOnBtncontinue(_ sender: UIButton) {
        delegate?.btnContinue(action: sender.title(for: .normal) ?? "Continue")
        parentView.removeFromSuperview()
    }
}
