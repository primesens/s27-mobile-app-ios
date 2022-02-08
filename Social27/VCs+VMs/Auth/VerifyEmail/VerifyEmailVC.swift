//
//  VerifyEmailVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-28.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class VerifyEmailVC: UIViewController {

    private let bag = DisposeBag()
    let vm = VerifyEmailVM()
    
    
    // MARK : Outlets
    
    @IBOutlet weak var viewBackBtn: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btnResendEmail: UIButton!
    @IBOutlet weak var lblResendEmail: UILabel!
    @IBOutlet weak var btnSignIn: UIButton!
    
    
    // MARK : LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    // MARK: - Config UI
    
    func configUI() {
        viewBackBtn.addCornerRadius(radius: 4)
        viewBackBtn.addViewShadow(offSet: 0.5, color: .lightGray)
        btnSignIn.addCornerRadius(radius: 9)
        btnResendEmail.addCornerRadius(radius: 9)
    }
    
    // MARK: - Outlet Action
    
    @IBAction func didTapOnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapOnResendCode(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapOnSignIn(_ sender: UIButton) {
        ApplicationServiceProvider.shared.pushToViewController(in: .Authentication, for: .SignInVC, from: self)
    }
}
