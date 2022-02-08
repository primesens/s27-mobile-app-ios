//
//  NetworkVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-06.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


class NetworkVC: UIViewController {
    
    // MARK: - Variables
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
    fileprivate let itemsPerRow: CGFloat = 2
    
    private let bag = DisposeBag()
    let vm = NetworkVM()
    
    // MARK: - Outlets
    
    @IBOutlet weak var networkCollectionView: UICollectionView! {
        didSet {
            networkCollectionView.dataSource = self
            networkCollectionView.delegate = self
        }
    }
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var radariconView: UIView!
    @IBOutlet weak var btnSegementedControl: UISegmentedControl!
    @IBOutlet weak var mainstackView: UIStackView!
    @IBOutlet weak var helloWorldTableView: UITableView! {
        didSet {
            helloWorldTableView.dataSource = self
            helloWorldTableView.delegate = self
        }
    }
    @IBOutlet weak var attendeeStackView: UIStackView!
    @IBOutlet weak var helloWorldTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var attendeeCollectionViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var btnStory: UIButton!
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        vm.getNetwork()
        vm.getHelloWorldSpeaker()
        configUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let height: CGFloat = 80 //whatever height you want to add to the existing height
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        
        self.helloWorldTableViewHeight.constant = CGFloat(380 * self.vm.arrHelloWroldSpeakers.count)
        
        self.attendeeCollectionViewHeight.constant = CGFloat(100 * self.vm.arrNetworks.count)
    }
    
    func configUI() {
        attendeeStackView.isHidden = true
        helloWorldTableView.isHidden = false
        topView.addBottomShadow()
        helloWorldTableViewHeight.constant = 0
        attendeeCollectionViewHeight.constant = 0
        radariconView.addViewShadow(offSet: 1, color: .lightGray)
        radariconView.addCornerRadius(radius: 5)
    }
    
    @IBAction func handleSegementedControlAction(_ sender: UISegmentedControl) {
        
        switch btnSegementedControl.selectedSegmentIndex {
        case 0:
            attendeeStackView.isHidden = true
            helloWorldTableView.isHidden = false
        case 1:
            attendeeStackView.isHidden = false
            helloWorldTableView.isHidden = true
        default:
            attendeeStackView.isHidden = true
            helloWorldTableView.isHidden = false
        }
    }
    
}

// MARK: - Extension - Table View

extension NetworkVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.arrHelloWroldSpeakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = helloWorldTableView.dequeueReusableCell(withIdentifier: "NetworlHelloWorldTVC", for: indexPath) as! NetworlHelloWorldTVC
        cell.configCell(model: vm.arrHelloWroldSpeakers[indexPath.row])
        return cell
    }
    
    
}

// MARK: - Extension - Collection View

extension NetworkVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.arrNetworks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: NetworkCVC = networkCollectionView.dequeueReusableCell(withReuseIdentifier: "NetworkCVC", for: indexPath) as! NetworkCVC
        cell.configCell(model: vm.arrNetworks[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            let ViewController = UIStoryboard.init(name: "Network", bundle: Bundle.main).instantiateViewController(withIdentifier: "SpeakerVC") as? SpeakerVC
            self.navigationController?.pushViewController(ViewController!, animated: true)
        
    }
    
    
}


// MARK: - CollectionView Flowlayout

extension NetworkVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
       
            let width = networkCollectionView.frame.width/2 - 10
            let height = width
            return CGSize(width: width, height: height)
    }
    
    
}
