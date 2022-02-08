//
//  ChatVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-16.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var chatImageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var btnSend: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func configUI() {
        
        topView.addBottomShadow()
        
        btnSend.addCornerRadius(radius: 5)
        
        chatImageView.layer.cornerRadius = chatImageView.frame.size.width/2
        statusView.layer.cornerRadius = statusView.frame.size.width/2
    }
    @IBAction func didTapOnBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
