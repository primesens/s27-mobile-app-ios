//
//  NotificationsVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-13.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class NotificationsVC: UIViewController {

    // MARK: Variables
    
    private let bag = DisposeBag()
    let vm = NotificationsVM()
    
    // MARK: Outlets
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var backBtnView: UIView!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var notificationsTableView: UITableView! {
        didSet {
            notificationsTableView.dataSource = self
            notificationsTableView.delegate = self
        }
    }
    @IBOutlet weak var btnViewAll: UIButton!
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        vm.getNotifications()
        configUI()
    }

    func configUI() {
        topView.addBottomShadow()
        backBtnView.addCornerRadius(radius: 4)
        backBtnView.addViewShadow(offSet: 0.5, color: .lightGray)
        btnViewAll.addCornerRadius(radius: 4)
//        backBtnView.addShadow(offSet: 0.5, color: .lightGray)
    }

    @IBAction func didTapOnBackBtn(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

extension NotificationsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.arrNotifications.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = notificationsTableView.dequeueReusableCell(withIdentifier: "NotificationsTVC", for: indexPath) as! NotificationsTVC
        cell.configCell(model: vm.arrNotifications[indexPath.row])
        return cell
    }
}

