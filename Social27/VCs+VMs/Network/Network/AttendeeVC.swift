//
//  AttendeeVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-03-15.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class AttendeeVC: UIViewController {
    
    // MARK: - Variables
    
    private let bag = DisposeBag()
    let vm = NetworkVM()
    
    // MARK: - Outlets
    
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var radarIconContainerView: UIView!
    @IBOutlet weak var btnRadar: UIButton!
    
    @IBOutlet weak var attendeeCollectionView: UICollectionView! {
        didSet {
            attendeeCollectionView.dataSource = self
            attendeeCollectionView.delegate = self
        }
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        vm.getNetwork()
    }
    
    // MARK: - Cinfigure UI
    
    func configUI() {
        radarIconContainerView.addViewShadow(offSet: 1, color: .lightGray)
        radarIconContainerView.addCornerRadius(radius: 5)
    }
}

// MARK: - UICollectionView Delegate, DataSource

extension AttendeeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.arrNetworks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: AttendeesCVC = attendeeCollectionView.dequeueReusableCell(withReuseIdentifier: "AttendeesCVC", for: indexPath) as! AttendeesCVC
        cell.configCell(model: vm.arrNetworks[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ViewController = UIStoryboard.init(name: "Network", bundle: Bundle.main).instantiateViewController(withIdentifier: "SpeakerVC") as? SpeakerVC
        self.navigationController?.pushViewController(ViewController!, animated: true)
    }
}


// MARK: - CollectionView Flowlayout

extension AttendeeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = attendeeCollectionView.frame.width/2 - 10
        let height = width
        return CGSize(width: width, height: height)
    }
}
