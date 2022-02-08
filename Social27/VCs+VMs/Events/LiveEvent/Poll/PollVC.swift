//
//  PollVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-20.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class PollVC: UIViewController {

    @IBOutlet weak var questionView: UIView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func configUI() {
        questionView.addCornerRadius(radius: 9)
        btn1.layer.cornerRadius = btn1.frame.size.width/2
        btn1.layer.borderColor = #colorLiteral(red: 0, green: 0.4705882353, blue: 0.8431372549, alpha: 1)
        btn1.layer.borderWidth = 1
        
        btn2.layer.cornerRadius = btn2.frame.size.width/2
        btn2.layer.borderColor = #colorLiteral(red: 0, green: 0.4705882353, blue: 0.8431372549, alpha: 1)
        btn2.layer.borderWidth = 1
        
        btn3.layer.cornerRadius = btn3.frame.size.width/2
        btn3.layer.borderColor = #colorLiteral(red: 0, green: 0.4705882353, blue: 0.8431372549, alpha: 1)
        btn3.layer.borderWidth = 1
        
        btn4.layer.cornerRadius = btn4.frame.size.width/2
        btn4.layer.borderColor = #colorLiteral(red: 0, green: 0.4705882353, blue: 0.8431372549, alpha: 1)
        btn4.layer.borderWidth = 1
    }
}
