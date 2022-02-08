//
//  GetStartedVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-01.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class GetStartedVC: UIViewController {
    
    // MARK: - Variables
    
    // MARK: - Outlets

    @IBOutlet weak var btnGetStarted: UIButton!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func configUI() {
        btnGetStarted.layer.cornerRadius = 9
    }
    
    // MARK: - Outlet Action
    
    @IBAction func didTapOnGetStarted(_ sender: UIButton) {
        ApplicationServiceProvider.shared.resetWindow(in: .Authentication, for: .AuthNC, from: self)
    }
    
}
