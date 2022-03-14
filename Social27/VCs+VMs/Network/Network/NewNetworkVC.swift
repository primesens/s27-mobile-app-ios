//
//  NewNetworkVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-03-14.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit

class NewNetworkVC: UIViewController {

    @IBOutlet weak var networkTableView: UITableView!
    {
        didSet {
            networkTableView.dataSource = self
            networkTableView.delegate = self
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.networkTableView.register(UINib(nibName: "HelloWorldTVC", bundle: nil), forCellReuseIdentifier: "HelloWorldTVC")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.updateByContentOffset()
            self?.startLoading()
        }
        
        self.networkTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.networkTableView.safeAdd(observer: self, forKeyPath: "contentOffset", options: [.new], context: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.stopIt(isStart: true)
        self.networkTableView.safeRemove(observer: self, forKeyPath: "contentOffset")
    }
    
    //MARK:- viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.stopIt(isStart: true)
    }
    
    private func stopIt(isStart:Bool) {
        guard let player = ModelObject.shared.videoPlayer else { return }
        player.isStopPlayer = isStart
    }
}

//MARK:-  UITableViewDelegate, UITableViewDataSource
extension NewNetworkVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ModelObject.shared.demoData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "HelloWorldTVC", for: indexPath) as! HelloWorldTVC
        let image = ModelObject.shared.demoData[indexPath.row].image
        cell.introImageView.dowloadFromServer(link: image ?? "")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let m = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
        return m*0.75
    }
}

extension NewNetworkVC {
    
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
        
        let p = CGPoint(x: self.networkTableView!.frame.width/2, y: self.networkTableView!.contentOffset.y + self.networkTableView!.frame.width/2)
        
        if let path = self.networkTableView!.indexPathForRow(at: p),
            self.presentedViewController == nil {
            self.updateCell(at: path)
        }
    }

    func updateCell(at indexPath: IndexPath) {
        
        if let cell = self.networkTableView.cellForRow(at: indexPath) as? HelloWorldTVC {
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

