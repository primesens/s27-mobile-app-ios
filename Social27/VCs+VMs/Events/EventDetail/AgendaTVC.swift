//
//  AgendaTVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-27.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

protocol AgendaTVCDelegate {
    func btnStartSession(_ tag: Int)
    func btnInfo(_ tag: Int)
}

class AgendaTVC: UITableViewCell {
    
    // MARK: - Variables
    
    static let instance = AgendaTVC()
    var delegate: AgendaTVCDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet weak var bgView           : UIView!
    @IBOutlet weak var lblDate          : UILabel!
    @IBOutlet weak var lblTime          : UILabel!
    @IBOutlet weak var lblDetail        : UILabel!
    @IBOutlet weak var lblSessionNumber : UILabel!
    @IBOutlet weak var btnViewOne       : UIView!
    @IBOutlet weak var btnViewTwo       : UIView!
    @IBOutlet weak var btnViewThree     : UIView!
    @IBOutlet weak var btnStartSession  : UIButton!
    @IBOutlet weak var btnInfo          : UIButton!
    @IBOutlet weak var btnCalendar      : UIButton!
    @IBOutlet weak var btnDelete        : UIButton!
    
    // MARK: - Config Cell
    
    func configCell(model: EventAgenda) {
        lblDate.text = model.date
        lblTime.text = model.time
        lblDetail.text = model.title
        lblSessionNumber.text = model.sessionNumber
    }
  
    // MARK: - Layout Subviews
    
    override func layoutSubviews() {
        bgView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        bgView.addCornerRadius(radius: 9)
        
        btnViewOne.layer.cornerRadius = btnViewOne.frame.size.width/2
        btnViewTwo.layer.cornerRadius = btnViewTwo.frame.size.width/2
        btnViewThree.layer.cornerRadius = btnViewThree.frame.size.width/2
    }
    
    
    @IBAction func didTapOnBtnStartSession(_ sender: UIButton) {
        delegate?.btnStartSession(sender.tag)
        print("StartSession")

    }
    
    @IBAction func didTapOnBtnViewInfo(_ sender: UIButton) {
        
        delegate?.btnInfo(sender.tag)
        print("ViewInfo")
    }
}
