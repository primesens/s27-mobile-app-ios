//
//  SignInVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-01.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SignInVC: BaseVC {
    
    // MARK: - Variables
    
    let vm = SignInVM()
    private let bag = DisposeBag()
    
    var isShow: Bool = false {
        didSet {
            if self.isShow {
                showPassword()
            } else{
                hidePassword()
            }
        }
    }
    
    // MARK: - Outlets

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var btnSignInLinkedIn: UIButton!
    @IBOutlet weak var btnSignInFaceBook: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    @IBOutlet weak var lblEmailError: UILabel!
    @IBOutlet weak var lblPasswordError: UILabel!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    
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
        btnSignIn.layer.cornerRadius = 9
        btnSignInLinkedIn.layer.cornerRadius = 9
        btnSignInFaceBook.layer.cornerRadius = 9
        
        lblEmailError.isHidden = true
        lblPasswordError.isHidden = true
    }
    
    // MARK: - Observers
    
    
    
    
    // MARK: - Outlet Action
    
    @IBAction func didTapOnSignUp(_ sender: UIButton) {
        ApplicationServiceProvider.shared.pushToViewController(in: .Authentication, for: .SignUpVC, from: self)
    }
    
    @IBAction func didTapOnSignIn(_ sender: UIButton) {
        signIn()
//        ApplicationServiceProvider.shared.resetWindow(in: .Tabbar, for: .MainTBC, from: self)
    }
    
    @IBAction func didTapOnForgotPassword(_ sender: UIButton) {
        ApplicationServiceProvider.shared.pushToViewController(in: .Authentication, for: .ForgotPasswordVC, from: self)
    }
    
    fileprivate func hidePassword() {
        passwordTF.isSecureTextEntry = true
    }
    
    fileprivate func showPassword() {
        passwordTF.isSecureTextEntry = false
    }
    
    fileprivate func signIn() {
        view.endEditing(true)
        
        guard !emailTF.text!.isEmpty && emailTF.text!.isValidEmail() else {
            emailTF.text = ""
            lblEmailError.isHidden = false
            lblEmailError.text = "Please enter a correct Email address"
            emailContainerView.layer.borderWidth = 2
            emailContainerView.layer.borderColor = #colorLiteral(red: 0.8628675342, green: 0.2278988659, blue: 0.1838823557, alpha: 1)
            emailContainerView.backgroundColor = .clear
            return
        }
        hideErrorMesssage()
        guard !passwordTF.text!.isEmpty else {
            passwordTF.text = ""
            lblPasswordError.isHidden = false
            lblPasswordError.text = "Please enter password"
            passwordContainerView.layer.borderWidth = 2
            passwordContainerView.layer.borderColor = #colorLiteral(red: 0.8628675342, green: 0.2278988659, blue: 0.1838823557, alpha: 1)
            passwordContainerView.backgroundColor = .clear
            return
        }
        hideErrorMesssage()
        self.startLoading()
        vm.login(email: emailTF.text!, password: passwordTF.text!) { (status, message, error) in
            self.stopLoading()
            if status {
                ApplicationServiceProvider.shared.resetWindow(in: .Tabbar, for: .MainTBC, from: self)
            } else if error != nil {
                self.passwordTF.text = ""
                self.presentAlert(title: "", message: error ?? "", buttonTitle: "OK")
            }
        }
    }
    
    fileprivate func hideErrorMesssage() {
        lblEmailError.isHidden = true
        emailContainerView.layer.borderColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        lblPasswordError.isHidden = true
        passwordContainerView.layer.borderColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        
    }
}

extension SignInVC {
    
    func loginRequest() {

    }
}

extension SignInVC {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTF {
            passwordTF.becomeFirstResponder()
        } else if textField == passwordTF {
            passwordTF.resignFirstResponder()
        }
        return true
    }
}
