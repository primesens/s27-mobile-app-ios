//
//  SignUpVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-01.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AuthenticationServices

class SignUpVC: BaseVC {
    
    // MARK: - Variables
    
    private let bag = DisposeBag()
    let vm = SignUpVM()
    
    var isShow: Bool = false {
        didSet {
            if self.isShow {
                showPassword()
            } else{
                hidePassword()
            }
        }
    }
    var isShowConfirm: Bool = false {
        didSet {
            if self.isShowConfirm {
                showPassword(tag: 1)
            } else{
                hidePassword(tag: 1)
            }
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var btnSignUpLinkedIn: UIButton!
    @IBOutlet weak var btnSignUpFaceBook: UIButton!
    
    @IBOutlet weak var firstnameContainerView: UIView!
    @IBOutlet weak var lastnameContainerView: UIView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordContainerView: UIView!
    
    @IBOutlet weak var lblFirstnameError: UILabel!
    @IBOutlet weak var lblLastnameError: UILabel!
    @IBOutlet weak var lblEmailError: UILabel!
    @IBOutlet weak var lblPasswordError: UILabel!
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        lblFirstnameError.isHidden = true
        lblLastnameError.isHidden = true
        lblEmailError.isHidden = true
        lblPasswordError.isHidden = true
        
        btnSignUp.layer.cornerRadius = 9
        btnSignUpLinkedIn.layer.cornerRadius = 9
        btnSignUpFaceBook.layer.cornerRadius = 9
    }
    
    fileprivate func createAccount() {
        view.endEditing(true)
        
        guard !firstNameTF.text!.isEmpty else {
            firstNameTF.text = ""
            lblFirstnameError.isHidden = false
            firstnameContainerView.layer.borderWidth = 2
            firstnameContainerView.layer.borderColor = #colorLiteral(red: 0.8628675342, green: 0.2278988659, blue: 0.1838823557, alpha: 1)
            firstnameContainerView.backgroundColor = .clear
            return
        }
        hideErrorMesssage()
        guard !lastNameTF.text!.isEmpty else {
            lastNameTF.text = ""
            lblLastnameError.isHidden = false
            lastnameContainerView.layer.borderWidth = 2
            lastnameContainerView.layer.borderColor = #colorLiteral(red: 0.8628675342, green: 0.2278988659, blue: 0.1838823557, alpha: 1)
            lastnameContainerView.backgroundColor = .clear
            return
        }
        hideErrorMesssage()
        guard !emailTF.text!.isEmpty else {
            emailTF.text = ""
            lblEmailError.isHidden = false
            emailContainerView.layer.borderWidth = 2
            emailContainerView.layer.borderColor = #colorLiteral(red: 0.8628675342, green: 0.2278988659, blue: 0.1838823557, alpha: 1)
            emailContainerView.backgroundColor = .clear
            return
        }
        hideErrorMesssage()
        guard !passwordTF.text!.isEmpty else {
            passwordTF.text = ""
            lblPasswordError.isHidden = false
            passwordContainerView.layer.borderWidth = 2
            passwordContainerView.layer.borderColor = #colorLiteral(red: 0.8628675342, green: 0.2278988659, blue: 0.1838823557, alpha: 1)
            passwordContainerView.backgroundColor = .clear
            return
        }
        hideErrorMesssage()
        if !isValidPassword(passwordTF.text!) {
            lblPasswordError.text = "Password must be at least 6 characters long, have a number, upper case text and a special symbol"
            lblPasswordError.isHidden = false
//            lblEmailError.text = "Password must be at least 6 characters long, have a number, upper case text and a special symbol"
            passwordContainerView.layer.borderWidth = 2
            passwordContainerView.layer.borderColor = #colorLiteral(red: 0.8628675342, green: 0.2278988659, blue: 0.1838823557, alpha: 1)
            passwordContainerView.backgroundColor = .clear
            return
        }
        hideErrorMesssage()
        self.startLoading()
        vm.signUp(email: emailTF.text!, firstName: firstNameTF.text!, lastName: lastNameTF.text!, password: passwordTF.text!) { (status, message, error) in
            self.stopLoading()
            if status {
                ApplicationServiceProvider.shared.resetWindow(in: .Tabbar, for: .MainTBC, from: self)
            } else if error != nil {
                self.presentAlert(title: "", message: error?.first?.message ?? "", buttonTitle: "OK")
            } else {
                self.presentAlert(title: "", message: message, buttonTitle: "OK")
                self.passwordTF.text = ""
            }
        }
    }
    
    func isValidPassword(_ password: String) -> Bool {
        let passRegEx = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9]).{6,}$"
        
        let passPred = NSPredicate(format:"SELF MATCHES %@", passRegEx)
        return passPred.evaluate(with: password)
    }
    
    fileprivate func hidePassword(tag:Int = 0) {
        if tag == 0 {
            passwordTF.isSecureTextEntry = true
        }
    }
    
    fileprivate func showPassword(tag:Int = 0) {
        if tag == 0 {
            passwordTF.isSecureTextEntry = false
        }
    }
    
    fileprivate func hideErrorMesssage() {
        lblFirstnameError.isHidden = true
        firstnameContainerView.layer.borderColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        lblLastnameError.isHidden = true
        lastnameContainerView.layer.borderColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        lblEmailError.isHidden = true
        emailContainerView.layer.borderColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        lblPasswordError.isHidden = true
        passwordContainerView.layer.borderColor = #colorLiteral(red: 0.9607843137, green: 0.9647058824, blue: 0.9803921569, alpha: 1)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    


    // MARK: - Outlet Action
    
    @IBAction func didTapOnSignIn(_ sender: UIButton) {
        ApplicationServiceProvider.shared.pushToViewController(in: .Authentication, for: .SignInVC, from: self)
    }
    
    @IBAction func didTapOnSignUpBtn(_ sender: UIButton) {
        createAccount()
    }
}

extension SignUpVC {
    func signupRequest() {

    }
}


