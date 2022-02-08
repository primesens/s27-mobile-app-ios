//
//  ProfileVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-07.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AuthenticationServices

class ProfileVC: BaseVC {
    
    // MARK: - Variables
    
    private let bag = DisposeBag()
    let vm = ProfileVM()
    
    // MARK: - Outlets
    
    @IBOutlet weak var profileVideoView : UIView!
    @IBOutlet weak var moreBtnView      : UIView!
    @IBOutlet weak var btnMore          : UIButton!
    
    @IBOutlet weak var profileImageView : UIView!
    @IBOutlet weak var profileImage     : UIImageView!
    @IBOutlet weak var lbName           : UILabel!
    @IBOutlet weak var lblRole          : UILabel!
    @IBOutlet weak var btnEdit          : UIButton!
    
    @IBOutlet weak var btnLinkedIn      : UIButton!
    @IBOutlet weak var btnFacebook      : UIButton!
    @IBOutlet weak var btnTwitter       : UIButton!
    
    @IBOutlet weak var interestViewOne  : UIView!
    @IBOutlet weak var interestViewTwo  : UIView!
    @IBOutlet weak var interestViewThree: UIView!
    @IBOutlet weak var btnAdd           : UIButton!
    @IBOutlet weak var lblBio           : UILabel!
    @IBOutlet weak var btnLogout        : UIButton!
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    // MARK: - Config UI
    
    func configUI() {
        profileVideoView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 30)
        moreBtnView.addCornerRadius(radius: 4)
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        
        btnLinkedIn.addCornerRadius(radius: 7)
        btnFacebook.addCornerRadius(radius: 7)
        btnTwitter.addCornerRadius(radius: 7)
        
        interestViewOne.addCornerRadius(radius: 4)
        interestViewTwo.addCornerRadius(radius: 4)
        interestViewThree.addCornerRadius(radius: 4)
        btnAdd.addCornerRadius(radius: 4)
    }
    
    @IBAction func btnLogout(_ sender: UIButton) {
        let alert = UIAlertController(title: "Logout", message: "Are you sure?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: {action in
            self.logout()
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Logout
    
    fileprivate func logout() {
//        self.startLoading()
//        self.vm.logout() { (success) in
//            self.stopLoading()
//            if success {
//                print("Logout succcess")
//
//
////                let controller = SignInVC.create(viewModel: SignInViewModel(canGoBack: false))
////                let navigation = UINavigationController(rootViewController: controller)
////                navigation.modalPresentationStyle = .fullScreen
//                ProfileStorage.instance.deleteProfileObjects(dataArray: [self.vm.user])
//                DataStore.shared.removeAllData{
                    ApplicationServiceProvider.shared.resetWindow(in: .Authentication, for: .AuthNC, from: self)
////                    return self.present(navigation, animated: true, completion: nil)
//                }
//
//            } else {
//                print("Logout fail")
//            }
//        }
        
    }

}
