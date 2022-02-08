//
//  EvenetsVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-07.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EvenetsVC: UIViewController {
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
    fileprivate let itemsPerRow: CGFloat = 2
    
    private let bag = DisposeBag()
    let vm = EvenetsVM()

    @IBOutlet weak var eventsTableView: UITableView! {
        didSet {
            eventsTableView.dataSource = self
            eventsTableView.delegate = self
        }
    }
    
    @IBOutlet weak var btnYourevents: UIButton!
    @IBOutlet weak var btnPublicEvents: UIButton!
    @IBOutlet weak var btnPastEvents: UIButton!
    @IBOutlet weak var topShadowView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        vm.getEvents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func configUI() {
        btnYourevents.addCornerRadius(radius: 13)
        btnPublicEvents.addCornerRadius(radius: 13)
        btnPastEvents.addCornerRadius(radius: 13)
        
        topShadowView.addBottomShadow()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        btnYourevents.titleLabel?.font =  UIFont(name: "Poppins-Regular", size: 10)
        btnPublicEvents.titleLabel?.font =  UIFont(name: "Poppins-Regular", size: 10)
        btnPastEvents.titleLabel?.font =  UIFont(name: "Poppins-Regular", size: 10)
        
    }
    
    @IBAction func didTapOnYourEvents(_ sender: UIButton) {
        btnYourevents.backgroundColor = #colorLiteral(red: 0.01568627451, green: 0.4705882353, blue: 0.8431372549, alpha: 1)
        btnYourevents.tintColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 1)
        btnPublicEvents.backgroundColor = #colorLiteral(red: 0.9601442218, green: 0.9645456672, blue: 0.9820135236, alpha: 1)
        btnPublicEvents.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func didTapOnPublicEvents(_ sender: UIButton) {
        btnPublicEvents.backgroundColor = #colorLiteral(red: 0.01568627451, green: 0.4705882353, blue: 0.8431372549, alpha: 1)
        btnPublicEvents.tintColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 1)
        btnYourevents.backgroundColor = #colorLiteral(red: 0.9601442218, green: 0.9645456672, blue: 0.9820135236, alpha: 1)
        btnYourevents.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}

extension EvenetsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.arrEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventsTableView.dequeueReusableCell(withIdentifier: "EventsTVC", for: indexPath) as! EventsTVC
        cell.configCell(model: vm.arrEvents[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moreEvents(clickedItem: vm.arrEvents[indexPath.row].key)
    }
    
    func moreEvents(clickedItem: EventsKey) {
        switch clickedItem {
        case .One:
            ApplicationServiceProvider.shared.pushToViewController(in: .Events, for: .EventDetailVC, from: self)
        case .Two:
            break
        case .Three:
            break
        }
    }
    
    
}
