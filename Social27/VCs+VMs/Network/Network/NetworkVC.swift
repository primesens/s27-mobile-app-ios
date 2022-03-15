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
    
    @IBOutlet weak var helloWorldView: UIView!
    @IBOutlet weak var attendeeView: UIView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btnSegementedControl: UISegmentedControl!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
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
    }
    
    func configUI() {
        topView.addBottomShadow()
    }
    
    @IBAction func handleSegementedControlAction(_ sender: UISegmentedControl) {
        
        switch btnSegementedControl.selectedSegmentIndex {
        case 0:
            helloWorldView.alpha = 1
            attendeeView.alpha = 0
        case 1:
            helloWorldView.alpha = 0
            attendeeView.alpha = 1
        default:
            break
        }
    }
}

