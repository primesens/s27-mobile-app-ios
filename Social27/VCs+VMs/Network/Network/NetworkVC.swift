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
import AVFoundation
import AVKit

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
    
    @IBOutlet weak var tableViewContainer: UIView!
    @IBOutlet weak var collectionViewContainer: UIView!
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
        
//        self.helloWorldTableView.register(UINib(nibName: "HelloWorldTVC", bundle: nil), forCellReuseIdentifier: "HelloWorldTVC")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.updateByContentOffset()
            self?.startLoading()
        }
        
        self.helloWorldTableView.reloadData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.helloWorldTableView.safeAdd(observer: self, forKeyPath: "contentOffset", options: [.new], context: nil)
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        self.helloWorldTableView.safeAdd(observer: self, forKeyPath: "contentOffset", options: [.new], context: nil)
//
//        let height: CGFloat = 80 //whatever height you want to add to the existing height
//        let bounds = self.navigationController!.navigationBar.bounds
//        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
//    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.stopIt(isStart: true)
        self.helloWorldTableView.safeRemove(observer: self, forKeyPath: "contentOffset")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.stopIt(isStart: true)
    }
    
    private func stopIt(isStart:Bool) {
        guard let player = ModelObject.shared.videoPlayer else { return }
        player.isStopPlayer = isStart
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let titleTextAttributesUnselect = [NSAttributedString.Key.foregroundColor: UIColor.black]
        btnSegementedControl.setTitleTextAttributes(titleTextAttributesUnselect, for: .normal)
        btnSegementedControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
        
        let font = UIFont.systemFont(ofSize: 14, weight: .light)          // Compute the right size
        btnSegementedControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        
//        self.helloWorldTableViewHeight.constant = CGFloat(420 * ModelObject.shared.demoData.count)
//        self.attendeeCollectionViewHeight.constant = CGFloat(100 * self.vm.arrNetworks.count)
    }
    
    func configUI() {
//        attendeeStackView.isHidden = true
        helloWorldTableView.isHidden = false
        topView.addBottomShadow()
//        helloWorldTableViewHeight.constant = 0
//        attendeeCollectionViewHeight.constant = 0
//        radariconView.addViewShadow(offSet: 1, color: .lightGray)
//        radariconView.addCornerRadius(radius: 5)
    }
    
    @IBAction func handleSegementedControlAction(_ sender: UISegmentedControl) {
        
        switch btnSegementedControl.selectedSegmentIndex {
        case 0:
//            collectionViewContainer.isHidden = true
//            tableViewContainer.isHidden = false
            break
        case 1:
//            collectionViewContainer.isHidden = false
//            tableViewContainer.isHidden = true
            break
        default:
//            collectionViewContainer.isHidden = true
//            tableViewContainer.isHidden = false
            break
        }
    }
}

// MARK: - Extension - Table View

extension NetworkVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return vm.arrHelloWroldSpeakers.count
        return ModelObject.shared.demoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = helloWorldTableView.dequeueReusableCell(withIdentifier: "NetworlHelloWorldTVC", for: indexPath) as! NetworlHelloWorldTVC
//        cell.configCell(model: vm.arrHelloWroldSpeakers[indexPath.row])
//        return cell
        
        let cell = helloWorldTableView.dequeueReusableCell(withIdentifier: "NetworlHelloWorldTVC", for: indexPath) as! NetworlHelloWorldTVC
        let image = ModelObject.shared.demoData[indexPath.row].image
        cell.introImageView.dowloadFromServer(link: image ?? "")
        cell.selectionStyle = .none
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let m = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
//        return m*0.75
//    }
}
extension NetworkVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == helloWorldTableView {
            updateByContentOffset()
        }
    }
}
extension NetworkVC {
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        //This logic means that user is staying on the timeline screen only.
        if keyPath == "contentOffset" {
            self.startVideoForCell()
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }
    
    func startVideoForCell() {
        self.updateByContentOffset()
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        self.perform(#selector(startLoading), with: nil, afterDelay: 0.3)
    }
    
    func updateByContentOffset() {
        
        let p = CGPoint(x: self.helloWorldTableView!.frame.width/2, y: self.helloWorldTableView!.contentOffset.y + self.helloWorldTableView!.frame.width/2)
        
        if let path = self.helloWorldTableView!.indexPathForRow(at: p),
            self.presentedViewController == nil {
            self.updateCell(at: path)
        }
    }

    func updateCell(at indexPath: IndexPath) {
        
        if let cell = self.helloWorldTableView.cellForRow(at: indexPath) as? NetworlHelloWorldTVC {
            // this thumb use when transition start and your video dosent start
            let postModel = ModelObject.shared.demoData[indexPath.row]
            ModelObject.shared.videoPlayer?.playView = cell.introImageView
            ModelObject.shared.videoPlayer?.thumbImageView.contentMode = cell.introImageView.contentMode
            //This means it contains video and text is not compulsory.
            if postModel.videoType == 1 {
                
                if let videoURL = URL(string: postModel.url ?? "") {
                    ModelObject.shared.videoPlayer?.isStopPlayer = false
                    ModelObject.shared.videoPlayer?.set(url: videoURL, state: { (status) in
                        switch status {
                        case .playing: break
                        case .failed(err: _): break
                        default: break
                        }
                    })
                }
            } else {
                self.destroyMMPlayerInstance()
            }
        }
    }
    
    func destroyMMPlayerInstance() {
        
        if let xpPlayer = ModelObject.shared.videoPlayer, xpPlayer.playView != nil {
            xpPlayer.isStopPlayer = true
            xpPlayer.playView = nil
        }
    }
    
    @objc func startLoading() {
        if self.presentedViewController != nil {
            return
        }
        // start loading video
        ModelObject.shared.videoPlayer?.startLoading()
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
