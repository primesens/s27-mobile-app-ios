//
//  RoundTablesOneOnOneTVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-27.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class RoundTablesOneOnOneTVC: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var bgView             : UIView!
    @IBOutlet weak var btnJoin            : UIButton!
    @IBOutlet weak var btnMore            : UIButton!
    @IBOutlet weak var displayImageBgView : UIView!
    @IBOutlet weak var lblEventName       : UILabel!
    @IBOutlet weak var lblEventDateTime   : UILabel!
    
    // MARK: - Config Cell
    
    func configCell(model: EventOneOnOneRoundTable) {
        lblEventName.text = model.topic
        lblEventDateTime.text = model.datAndTime
    }
  
    // MARK: - Layout Subviews
    
    override func layoutSubviews() {
        bgView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = #colorLiteral(red: 0.8941176534, green: 0.8941176534, blue: 0.894117713, alpha: 1)
        bgView.layer.cornerRadius = 8
        
        displayImageBgView.layer.borderWidth = 1
        displayImageBgView.layer.borderColor = #colorLiteral(red: 0.8941176534, green: 0.8941176534, blue: 0.894117713, alpha: 1)
        displayImageBgView.layer.cornerRadius = 8
        
        btnJoin.addCornerRadius(radius: 4)
    }

}
