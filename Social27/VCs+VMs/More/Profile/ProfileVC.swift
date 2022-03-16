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
import AVKit

class ProfileVC: BaseVC {
    
    // MARK: - Variables
    
    private let bag     = DisposeBag()
    let vm              = ProfileVM()
    
    var player          : AVPlayer?
    var avpController   = AVPlayerViewController()
    
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
        getCurrentVideo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        // Pause player
        //        if player != nil {
        //            player?.pause()
        //        }
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
        //        let alert = UIAlertController(title: "Logout", message: "Are you sure?", preferredStyle: .alert)
        //        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: {action in
        //            self.logout()
        //        }))
        //        alert.addAction(UIAlertAction(title: "No", style: .default, handler: nil))
        //        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func didTapOnEditProfile(_ sender: UIButton) {
        ApplicationServiceProvider.shared.pushToViewController(in: .More, for: .EditProfileVC, from: self)
    }
    
    @IBAction func didTapOnBtnAddInterest(_ sender: UIButton) {
        ApplicationServiceProvider.shared.pushToViewController(in: .More, for: .AddInterestVC, from: self)
    }
    
    func getCurrentVideo() {
        self.playVideo()
        //        self.startLoading()
        //
        //        vm.getCurrentVideoNetworkRequest { (success, statusCode, message) in
        //            self.stopLoading()
        //            if success {
        //                if let _video = self.vm.currentVideo {
        //
        //                    if _video._id == nil {
        //                        self.btnSpotMistakes.isUserInteractionEnabled = false
        //                        AlertView.instance.showCustomAlert(title: .Alert, message: .NoCurrentVideo , action: CustomAlertAction(title: .Dismiss))
        //                    } else {
        //                         self.btnSpotMistakes.isUserInteractionEnabled = true
        //                    }
        //
        //                    // Manage UI with current video and saved current video info
        //                    self.manageActionButtonTitleWithCurrentVideoInfo()
        //
        //                    // Play video
        //                    //print("**** CURRENT VIDEO ID - \(_video._id ?? 0)")
        //                    self.playVideo(video: _video)
        //
        //                    self.lblPrizeAmount.text = "$\(_video.prizeAmount ?? "00")"
        //
        //
        //                } else  {
        //                    AlertView.instance.showCustomAlert(title: .Alert, message: .NoCurrentVideo , action: CustomAlertAction(title: .Dismiss))
        //                }
        //            } else {
        //                AlertView.instance.showCustomAlert(title: .Alert, message: message, action: CustomAlertAction(title: .Dismiss))
        //            }
        //        }
    }
    
    // MARK: Play video
    func playVideo() {
        
        if let _url = URL(string: "https://d3v42n63sui3ft.cloudfront.net/hls/10706/output.m3u8") {
            player = AVPlayer(url: _url)
            avpController.player = player
            avpController.view.frame.size.height = self.profileVideoView.frame.size.height
            avpController.view.frame.size.width = self.profileVideoView.frame.size.width
            self.profileVideoView.addSubview(avpController.view)
            avpController.entersFullScreenWhenPlaybackBegins = true
            avpController.exitsFullScreenWhenPlaybackEnds = true
            
        }
    }
    

}
