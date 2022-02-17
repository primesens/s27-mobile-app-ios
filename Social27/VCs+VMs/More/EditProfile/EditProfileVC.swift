//
//  EditProfileVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-02-11.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class EditProfileVC: UIViewController {

    // MARK: - Variables
    
    private let bag = DisposeBag()
    let vm = EditProfileVM()
    
    // MARK: - Outlets
    
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
    @IBOutlet weak var socialAccountTableView: UITableView! {
        didSet {
            socialAccountTableView.delegate = self
            socialAccountTableView.dataSource = self
        }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        vm.getSocialAccounts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - Configure UI
    
    func configUI() {
        VideoView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 30)
        addVideoView.layer.cornerRadius = addVideoView.frame.size.width/2
        profilePictureView.layer.cornerRadius = profilePictureView.frame.size.width/2
        addProfileImageView.layer.cornerRadius = addProfileImageView.frame.size.width/2
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        addVideoView.layer.cornerRadius = addVideoView.frame.size.width/2
        backBtnView.addCornerRadius(radius: 5)
        backBtnView.addShadow(offSet: 0.1, color: .lightGray)
        btnSave.addCornerRadius(radius: 5)
    }
    
    // MARK: - Outlet Action
    
    @IBAction func didTapOnBtnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Extension

// MARK: - TableView Delegate and Datasource

extension EditProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.arrSocialaccount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = socialAccountTableView.dequeueReusableCell(withIdentifier: "SocialAccountTVC", for: indexPath) as! SocialAccountTVC
        cell.configCell(model: vm.arrSocialaccount[indexPath.row])
        return cell
    }
    
    
}
