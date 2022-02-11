//
//  EditProfileVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-02-11.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {

    @IBOutlet weak var VideoView: UIView!
    @IBOutlet weak var backBtnView: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var addVideoView: UIView!
    @IBOutlet weak var btnAddVideo: UIButton!
    @IBOutlet weak var profilePictureView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var addProfileImageView: UIView!
    @IBOutlet weak var btnAddProfileImage: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func configUI() {
        VideoView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 30)
        profilePictureView.layer.cornerRadius = profilePictureView.frame.size.width/2
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        addVideoView.layer.cornerRadius = addVideoView.frame.size.width/2
        backBtnView.addCornerRadius(radius: 5)
        btnSave.addCornerRadius(radius: 5)
    }
    @IBAction func didTapOnBtnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
