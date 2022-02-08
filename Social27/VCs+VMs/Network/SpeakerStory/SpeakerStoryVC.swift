//
//  SpeakerStoryVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-01-04.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit

class SpeakerStoryVC: UIViewController {
    
    // MARK: Variables
    
    // MARK: Outlets
    
    @IBOutlet weak var storyView         : UIView!
    @IBOutlet weak var storyprogressView : UIProgressView!
    @IBOutlet weak var imageView         : UIImageView!
    @IBOutlet weak var lblName           : UILabel!
    @IBOutlet weak var lblPostedTime     : UILabel!
    @IBOutlet weak var btnClose          : UIButton!
    @IBOutlet weak var btnConnect        : UIButton!
    @IBOutlet weak var btnLike           : UIButton!
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        btnConnect.addCornerRadius(radius: 20)
    }

    // MARK: Outlet Action
    
    @IBAction func didTapOnBtnClose(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
