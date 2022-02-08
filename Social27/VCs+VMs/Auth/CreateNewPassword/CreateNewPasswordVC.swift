//
//  CreateNewPasswordVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-28.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class CreateNewPasswordVC: UIViewController {

    // MARK : Outlets
    
    @IBOutlet weak var viewBackBtn: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var newPasswordTF: DesignableUITextField!
    @IBOutlet weak var btnEyeOne: UIButton!
    @IBOutlet weak var confirmPasswordTF: DesignableUITextField!
    @IBOutlet weak var btnEyeTwo: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    // MARK : LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    // MARK: - Config UI
    
    func configUI() {
        viewBackBtn.addCornerRadius(radius: 4)
        viewBackBtn.addViewShadow(offSet: 0.5, color: .lightGray)
        btnSave.addCornerRadius(radius: 9)
    }
    
    @IBAction func didTapOnBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapOnEyeOne(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapOnEyeTwo(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapOnSaveBtn(_ sender: UIButton) {
        
    }
}
