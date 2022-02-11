//
//  EventInfo.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-02-11.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit

protocol EventInfoDelegate {
    func btnComplete(action: String)
}

class EventInfo: UIView {
    
    // MARK: - Variables
    
    static let instance = EventInfo()
    var delegate: EventInfoDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet var parentView               : UIView!
    @IBOutlet weak var popUpView           : UIView!
    @IBOutlet weak var btnClose            : UIButton!
    @IBOutlet weak var lblTitle            : UILabel!
    @IBOutlet weak var hostImage           : UIImageView!
    @IBOutlet weak var lblHostName         : UILabel!
    @IBOutlet weak var containerViewShare  : UIView!
    @IBOutlet weak var containerViewCopy   : UIView!
    @IBOutlet weak var containerViewTag    : UIView!
    @IBOutlet weak var containerViewCalenar: UIView!
    @IBOutlet weak var btnShare            : UIButton!
    @IBOutlet weak var btnCopy             : UIButton!
    @IBOutlet weak var lblDate             : UILabel!
    @IBOutlet weak var lblTime             : UILabel!
    @IBOutlet weak var btnAddToCalendar    : UIButton!
    @IBOutlet weak var lblAboutevent       : UILabel!
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("EventInfo", owner: self, options: nil)
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
        
        hostImage.addCornerRadius(radius: 5)
        
        containerViewShare.layer.cornerRadius = containerViewShare.frame.size.width/2
        containerViewCopy.layer.cornerRadius = containerViewCopy.frame.size.width/2
        
        containerViewTag.addCornerRadius(radius: 5)
        containerViewCalenar.addCornerRadius(radius: 5)
        containerViewCalenar.addShadow(offSet: 0.5, color: .lightGray)
        
        btnAddToCalendar.addCornerRadius(radius: 6)
    }

    func showEventInfoview(from vc: UIViewController) {
        self.delegate = vc as? EventInfoDelegate
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
    
    // MARK: - Button Actions
    
    @IBAction func didTapOnBtnClose(_ sender: UIButton) {
        parentView.removeFromSuperview()
    }
    
    @IBAction func didTapOnBtnShare(_ sender: UIButton) {
    
    }
    
    @IBAction func didTapOnBtnCopy(_ sender: UIButton) {
    
    }
    
    @IBAction func didTapOnBtnAddToCalendar(_ sender: UIButton) {
    
    }
}
