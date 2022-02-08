//
//  RegisterVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-15.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var topShadowView: UIView!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var backBtnView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    

    func configUI() {
        backBtnView.addViewShadow(offSet: 1, color: .lightGray)
        backBtnView.addCornerRadius(radius: 5)
        topShadowView.addBottomShadow()
        btnRegister.addCornerRadius(radius: 4)
    }

    @IBAction func didTapOnBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
