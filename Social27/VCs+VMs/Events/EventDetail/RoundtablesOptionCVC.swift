//
//  RoundtablesOptionCVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-27.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class RoundtablesOptionCVC: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var lblRoundTableOption: UILabel!
    
    // MARK: - Config Cell
    
    func configCell(model: EventRoundTableOptions) {
        lblRoundTableOption.text = model.key.rawValue
    }
  
    // MARK: - Layout Subviews
    
    override func layoutSubviews() {
        
        let redView = UIView(frame: bounds)
        redView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        redView.layer.cornerRadius = 15
        self.backgroundView = redView

        let blueView = UIView(frame: bounds)
        blueView.backgroundColor = #colorLiteral(red: 0.005387776997, green: 0.471904695, blue: 0.8421573043, alpha: 1)
        blueView.layer.cornerRadius = 15
        self.selectedBackgroundView = blueView
    }
    
    func buttonHighlight() {
        let blueView = UIView(frame: bounds)
        blueView.backgroundColor = #colorLiteral(red: 0.005387776997, green: 0.471904695, blue: 0.8421573043, alpha: 1)
        blueView.layer.cornerRadius = 15
        lblRoundTableOption.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.selectedBackgroundView = blueView
    }
    
    func buttonRemoveHighlight() {
        let redView = UIView(frame: bounds)
        redView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        redView.layer.cornerRadius = 15
        lblRoundTableOption.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.backgroundView = redView
    }
}
