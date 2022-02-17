//
//  AddInterestVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-02-14.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit

class AddInterestVC: UIViewController {

    // MARK: - Variables
    
    // MARK: - Outlets
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var backBtnview: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var notificationBtnView: UIView!
    @IBOutlet weak var btnNotification: UIButton!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var interestCollectionview: UICollectionView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - Configure UI
    
    func configUI() {
        topView.addBottomShadow()
        backBtnview.addCornerRadius(radius: 5)
        backBtnview.addShadow(offSet: 0.1, color: .lightGray)
        notificationBtnView.addCornerRadius(radius: 5)
        notificationBtnView.addShadow(offSet: 0.1, color: .lightGray)
        
    }

    @IBAction func didTapOnBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapOnNotificationBtn(_ sender: UIButton) {
        
    }
}
