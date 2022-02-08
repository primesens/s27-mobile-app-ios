//
//  MyAgendaTVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-27.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class MyAgendaTVC: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var bgView           : UIView!
    @IBOutlet weak var lblDate          : UILabel!
    @IBOutlet weak var lblTime          : UILabel!
    @IBOutlet weak var lblSession       : UILabel!
    @IBOutlet weak var lblSessionDetail : UILabel!
    @IBOutlet weak var btnDelete        : UIButton!
    
    // MARK: - Config Cell
    
    func configCell(model: EventMyAgenda) {
        lblDate.text = model.date
        lblTime.text = model.time
        lblSession.text = model.title
        lblSessionDetail.text = model.sessionDetail
    }
  
    // MARK: - Layout Subviews
    
    override func layoutSubviews() {
        bgView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        bgView.addCornerRadius(radius: 9)
    }
}
