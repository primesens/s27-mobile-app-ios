//
//  HomeVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-06.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import AVKit

enum HomeCollectionViews {
    case HappeningNow, Speakers, Sponsors
}

class HomeVC: UIViewController {
    
    // MARK: - Variables
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0)
    fileprivate let itemsPerRow: CGFloat = 2
    
    private let bag = DisposeBag()
    let vm = HomeVM()
    
    // MARK: - Outlets
    
    @IBOutlet weak var topShadowView: UIView!
    @IBOutlet weak var lblNavBarDate: UILabel!
    @IBOutlet weak var lblNavBarName: UILabel!
    @IBOutlet weak var searchBarTF: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var btnToday: UIButton!
    @IBOutlet weak var btnThisWeek: UIButton!
    
    @IBOutlet weak var happeningNowCollectionView: UICollectionView! {
        didSet {
            happeningNowCollectionView.dataSource = self
            happeningNowCollectionView.delegate = self
        }
    }
    @IBOutlet weak var speakersCollectionView: UICollectionView! {
        didSet {
            speakersCollectionView.dataSource = self
            speakersCollectionView.delegate = self
        }
    }
    
    @IBOutlet weak var sponsorsCollectionView: UICollectionView! {
        didSet {
            sponsorsCollectionView.dataSource = self
            sponsorsCollectionView.delegate = self
        }
    }
    
    @IBOutlet weak var featuredAttendiesCollectionView: UICollectionView! {
        didSet {
            featuredAttendiesCollectionView.dataSource = self
            featuredAttendiesCollectionView.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.gethappeningNow()
        vm.getSpeakers()
        vm.getSponsors()
        vm.getAttendies()
        configUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.updateByContentOffset()
            self?.startLoading()
        }
        
        self.featuredAttendiesCollectionView.reloadData()
    }
    
    func configUI() {
        topShadowView.addBottomShadow()
        
        btnToday.addCornerRadius(radius: 13)
        btnThisWeek.addCornerRadius(radius: 13)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let height: CGFloat = 80 //whatever height you want to add to the existing height
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        
        self.featuredAttendiesCollectionView.safeAdd(observer: self, forKeyPath: "contentOffset", options: [.new], context: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.stopIt(isStart: true)
        self.featuredAttendiesCollectionView.safeRemove(observer: self, forKeyPath: "contentOffset")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        self.stopIt(isStart: true)
    }
    
    private func stopIt(isStart:Bool) {
        guard let player = ModelObject.shared.videoPlayer else { return }
        player.isStopPlayer = isStart
    }
    // MARK: - Outlet Action
    
    @IBAction func didTapOnNotification(_ sender: UIButton) {
        ApplicationServiceProvider.shared.pushToViewController(in: .Main, for: .NotificationsVC, from: self)
    }
    
    @IBAction func didTapOnToday(_ sender: UIButton) {
        btnToday.backgroundColor = #colorLiteral(red: 0.01568627451, green: 0.4705882353, blue: 0.8431372549, alpha: 1)
        btnToday.tintColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 1)
        btnThisWeek.backgroundColor = #colorLiteral(red: 0.9601442218, green: 0.9645456672, blue: 0.9820135236, alpha: 1)
        btnThisWeek.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    @IBAction func didTapOnThisWeek(_ sender: UIButton) {
        btnThisWeek.backgroundColor = #colorLiteral(red: 0.01568627451, green: 0.4705882353, blue: 0.8431372549, alpha: 1)
        btnThisWeek.tintColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 0.9999999404, alpha: 1)
        btnToday.backgroundColor = #colorLiteral(red: 0.9601442218, green: 0.9645456672, blue: 0.9820135236, alpha: 1)
        btnToday.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}

// MARK: - UICollectionViewDelegate and UICollectionViewDataSource

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == happeningNowCollectionView) {
            return vm.arrHappeningNow.count
        } else if (collectionView == featuredAttendiesCollectionView) {
//            return vm.arrAttendies.count
            return ModelObject.shared.demoData.count
        } else if (collectionView == speakersCollectionView) {
            return vm.arrSpeakers.count
        } else if (collectionView == sponsorsCollectionView) {
            return vm.arrSponsors.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == happeningNowCollectionView) {
            let cell: HappeningNowCVC = happeningNowCollectionView.dequeueReusableCell(withReuseIdentifier: "HappeningNowCVC", for: indexPath) as! HappeningNowCVC
            cell.configCell(model: vm.arrHappeningNow[indexPath.row])
            return cell
        } else if (collectionView == featuredAttendiesCollectionView) {
//            let cell: AttendiesCVC = featuredAttendiesCollectionView.dequeueReusableCell(withReuseIdentifier: "AttendiesCVC", for: indexPath) as! AttendiesCVC
//            cell.configCell(model: vm.arrAttendies[indexPath.row])
//            return cell
            
            let cell: AttendiesCVC = featuredAttendiesCollectionView.dequeueReusableCell(withReuseIdentifier: "AttendiesCVC", for: indexPath) as! AttendiesCVC
            let image = ModelObject.shared.demoData[indexPath.row].image
            cell.playerimageView.dowloadFromServer(link: image ?? "")
            return cell
        } else if (collectionView == speakersCollectionView) {
            let cell: SpeakersCVC = speakersCollectionView.dequeueReusableCell(withReuseIdentifier: "SpeakersCVC", for: indexPath) as! SpeakersCVC
            cell.configCell(model: vm.arrSpeakers[indexPath.row])
            return cell
        } else if (collectionView == sponsorsCollectionView) {
            let cell: SponsorsCVC = sponsorsCollectionView.dequeueReusableCell(withReuseIdentifier: "SponsorsCVC", for: indexPath) as! SponsorsCVC
            cell.configCell(model: vm.arrSponsors[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == happeningNowCollectionView) {
            
        } else if (collectionView == featuredAttendiesCollectionView) {
            
        } else if (collectionView == speakersCollectionView) {
            let ViewController = UIStoryboard.init(name: "Network", bundle: Bundle.main).instantiateViewController(withIdentifier: "SpeakerVC") as? SpeakerVC
            self.navigationController?.pushViewController(ViewController!, animated: true)
        } else if (collectionView == sponsorsCollectionView) {
            
        }
    }
}

extension HomeVC {
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
        
        let p = CGPoint(x: self.featuredAttendiesCollectionView!.frame.width/2, y: self.featuredAttendiesCollectionView!.contentOffset.y + self.featuredAttendiesCollectionView!.frame.width/2)
        
        if let path = self.featuredAttendiesCollectionView!.indexPathForItem(at: p),
            self.presentedViewController == nil {
            self.updateCell(at: path)
        }
    }
    
    func updateCell(at indexPath: IndexPath) {
        
        if let cell = self.featuredAttendiesCollectionView.cellForItem(at: indexPath) as? AttendiesCVC {
            // this thumb use when transition start and your video dosent start
            let postModel = ModelObject.shared.demoData[indexPath.row]
            ModelObject.shared.videoPlayer?.playView = cell.playerimageView
            ModelObject.shared.videoPlayer?.thumbImageView.contentMode = cell.playerimageView.contentMode
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

// MARK: - CollectionView Flowlayout

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (collectionView == happeningNowCollectionView) {
            let width = happeningNowCollectionView.frame.width - 20
            //            let height = width
            return CGSize(width: width, height: 280)
        } else if (collectionView == featuredAttendiesCollectionView) {
            //            let width = speakersCollectionView.frame.width / 3 - 10
            //            let height = width
            return CGSize(width: 120, height: 180 )
        } else if (collectionView == speakersCollectionView) {
            //            let width = speakersCollectionView.frame.width / 3 - 10
            //            let height = width
            return CGSize(width: 120, height: 120 )
        } else if (collectionView == sponsorsCollectionView) {
            let width = speakersCollectionView.frame.width / 3
            let height = width
            return CGSize(width: width, height: height)
        }
        return CGSize()
    }
    
    
    
    
}
