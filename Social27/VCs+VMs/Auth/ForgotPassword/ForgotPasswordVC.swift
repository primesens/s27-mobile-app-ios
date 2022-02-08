//
//  ForgotPasswordVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-28.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ForgotPasswordVC: BaseVC {
    
    // MARK: - Variables
    
    let vm = ForgotPasswordVM()
    private let bag = DisposeBag()
    
    // MARK: - Outlets
    
    @IBOutlet weak var viewBackBtn: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTF: DesignableUITextField!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var lblEmailError: UILabel!
    @IBOutlet weak var heightErrorLbl: NSLayoutConstraint!
    

    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    // MARK: - Config UI
    
    func configUI() {
        lblEmailError.isHidden = true
        heightErrorLbl.constant = 0
        viewBackBtn.addCornerRadius(radius: 4)
        viewBackBtn.addViewShadow(offSet: 0.5, color: .lightGray)
        btnSend.addCornerRadius(radius: 9)
    }
    
    // MARK: - Outlet Action
    
    @IBAction func didTapOnBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapOnSend(_ sender: UIButton) {
        resetPass()
//        ApplicationServiceProvider.shared.pushToViewController(in: .Authentication, for: .VerifyEmailVC, from: self)
    }
    
    fileprivate func resetPass() {
        guard !emailTF.text!.isEmpty && emailTF.text!.isValidEmail() else {
            presentAlert(title: "", message: "Please enter Email", buttonTitle: "OK")
            invalideTF(view: emailContainerView, label: lblEmailError)
            return
        }
        self.startLoading()
        vm.forgotPass(email: emailTF.text!) { (status, result, error) in
            self.stopLoading()
            if status {
//                let vc = VerifyEmailVC.create(viewModel: VerifyEmailVM(email: self.emailTF.text!))
//                self.navigationController?.pushViewController(vc, animated: true)
                
                ApplicationServiceProvider.shared.pushToViewController(in: .Authentication, for: .VerifyEmailVC, from: self)
            }  else if error != nil {
                self.presentAlert(title: "", message: error?.first?.message ?? "", buttonTitle: "OK")
            } else{
                self.presentAlert(title: "", message: result ?? "", buttonTitle: "OK")
            }
        }
    }
    
    fileprivate func hideErrorMesssage() {
        lblEmailError.isHidden = true
        heightErrorLbl.constant = 0
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
            self.lblEmailError.alpha = 0
        }
        valideTF(view: emailContainerView, label: lblEmailError)
    }
    
    fileprivate func showErrorMesssage(with message: String) {
        lblEmailError.isHidden = false
        lblEmailError.text = message
        heightErrorLbl.constant = 20
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
            self.lblEmailError.alpha = 1
        }
    }
    
    fileprivate func invalideTF(view: UIView, label: UILabel) {
        showErrorMesssage(with: "Please enter a correct Email address")
        view.layer.borderWidth = 2
        view.layer.borderColor = #colorLiteral(red: 0.8628675342, green: 0.2278988659, blue: 0.1838823557, alpha: 1)
        view.backgroundColor = .clear
        label.textColor = #colorLiteral(red: 0.8628675342, green: 0.2278988659, blue: 0.1838823557, alpha: 1)
    }
    
    fileprivate func valideTF(view: UIView, label: UILabel) {
        hideErrorMesssage()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.appColor(.blueSky)!.cgColor
        view.backgroundColor = UIColor.white
        label.textColor = UIColor.appColor(.grey)
    }
}
