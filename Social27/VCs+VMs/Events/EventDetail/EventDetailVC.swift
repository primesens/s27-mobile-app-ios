//
//  EventDetailVC.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-10.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class EventDetailVC: UIViewController {
    
    // MARK: - Variables
    
    private let bag = DisposeBag()
    let vm = EventDetailVM()
    
    // MARK: - Outlets
    
    @IBOutlet weak var backBtnView: UIView!
    @IBOutlet weak var favouriteBtnView: UIView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var eventLogoView: UIView!
    @IBOutlet weak var lblEventHost: UILabel!
    
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnJoinEvent: UIButton!
    
    @IBOutlet weak var lblAboutEvent: UILabel!
    @IBOutlet weak var btnLinkedIn: UIButton!
    @IBOutlet weak var btnTwitter: UIButton!
    @IBOutlet weak var btnFacebook: UIButton!
    @IBOutlet weak var btnInstagram: UIButton!
    
    @IBOutlet weak var featuredScheduleDetailView: UIView!
    @IBOutlet weak var lblScheduledTime: UILabel!
    @IBOutlet weak var lblScheduledEventIntro: UILabel!
    
    @IBOutlet weak var boothBgView: UIView!
    @IBOutlet weak var boothBgImage: UIImageView!
    @IBOutlet weak var boothLogoImage: UIImageView!
    @IBOutlet weak var lblBoothTitle: UILabel!
    @IBOutlet weak var lblBoothDescription: UILabel!
    
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var btnSearch: UIButton!
    
    @IBOutlet weak var bgviewSort: UIView!
    @IBOutlet weak var btnSort: UIButton!
    
    @IBOutlet weak var btnAddSessionAgenda: UIButton!
    
    @IBOutlet weak var btnMyMeetings: UIButton!
    @IBOutlet weak var btnPublic: UIButton!
    @IBOutlet weak var btnSponsored: UIButton!
    
    @IBOutlet weak var roundTableSearchTF: UITextField!
    @IBOutlet weak var roundTableSearchBtn: UIButton!
    
    @IBOutlet weak var viewAccepted: UIView!
    @IBOutlet weak var viewPending: UIView!
    @IBOutlet weak var viewDeclined: UIView!
    @IBOutlet weak var btnCreateMeetingRT: UIButton!
    
    @IBOutlet weak var roundTablesMeetingOptionView: UIView!
    @IBOutlet weak var sponsorsCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var speakersTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var networkingTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var agendaTableviewHeight: NSLayoutConstraint!
    @IBOutlet weak var myAgendaTableviewHeight: NSLayoutConstraint!
    @IBOutlet weak var roundTablesOneOnOneTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var roundTablesBoardroomTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var roundTablesRTTableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var aboutStackView: UIStackView!
    @IBOutlet weak var speakersStackView: UIStackView!
    @IBOutlet weak var networkingStackView: UIStackView!
    @IBOutlet weak var agendaStackView: UIStackView!
    @IBOutlet weak var myAgendastackView: UIStackView!
    @IBOutlet weak var roundtablesStackView: UIStackView!
    
    
    
    
    @IBOutlet weak var eventOptionCollectionView: UICollectionView! {
        didSet {
            eventOptionCollectionView.dataSource = self
            eventOptionCollectionView.delegate = self
        }
    }
    @IBOutlet weak var eventSponsorsCollectionView: UICollectionView! {
        didSet {
            eventSponsorsCollectionView.dataSource = self
            eventSponsorsCollectionView.delegate = self
        }
    }
    @IBOutlet weak var featuredScheduleDatecollectionView: UICollectionView! {
        didSet {
            featuredScheduleDatecollectionView.dataSource = self
            featuredScheduleDatecollectionView.delegate = self
        }
    }
    
    @IBOutlet weak var speakersTableView: UITableView! {
        didSet {
            speakersTableView.dataSource = self
            speakersTableView.delegate = self
        }
    }
    @IBOutlet weak var networkingTableView: UITableView! {
        didSet {
            networkingTableView.dataSource = self
            networkingTableView.delegate = self
        }
    }
    
    @IBOutlet weak var AgendaTableView: UITableView! {
        didSet {
            AgendaTableView.dataSource = self
            AgendaTableView.delegate = self
        }
    }
    @IBOutlet weak var myAgendaTableView: UITableView! {
        didSet {
            myAgendaTableView.dataSource = self
            myAgendaTableView.delegate = self
        }
    }
    
    @IBOutlet weak var roundTablesOptionCollectionView: UICollectionView! {
        didSet {
            roundTablesOptionCollectionView.dataSource = self
            roundTablesOptionCollectionView.delegate = self
        }
    }
    
    @IBOutlet weak var roundTablesOneOnOneTableView: UITableView! {
        didSet {
            roundTablesOneOnOneTableView.dataSource = self
            roundTablesOneOnOneTableView.delegate = self
        }
    }
    
    @IBOutlet weak var roundTablesRTTableView: UITableView! {
        didSet {
            roundTablesRTTableView.dataSource = self
            roundTablesRTTableView.delegate = self
        }
    }
    
    @IBOutlet weak var roundTablesBoardroomTableView: UITableView! {
        didSet {
            roundTablesBoardroomTableView.dataSource = self
            roundTablesBoardroomTableView.delegate = self
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        vm.getEventOptions()
        vm.getEventSponsors()
        vm.getFeaturedSchedule()
        vm.getEventSpeakers()
        vm.getEventNetworking()
        vm.getEventAgenda()
        vm.getEventMyAgenda()
        vm.getEventRoundTableOptions()
        vm.getEventOneOnOneRoundTable()
        vm.getEventRTRoundTable()
        vm.getEventBoardroomRoundTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        speakersStackView.isHidden = true
        networkingStackView.isHidden = true
        agendaStackView.isHidden = true
        myAgendastackView.isHidden = true
        roundtablesStackView.isHidden = true
        
        self.sponsorsCollectionViewHeight.constant = CGFloat(33 * self.vm.arrEventSponsors.count)
        
        self.speakersTableViewHeight.constant = CGFloat(75 * self.vm.arrEventSpeakers.count + 2)
        
        self.networkingTableViewHeight.constant = CGFloat(130 * self.vm.arrEventNetworking.count + 2)
        
        self.agendaTableviewHeight.constant = CGFloat(130 * self.vm.arrEventAgenda.count + 2)
        
        self.myAgendaTableviewHeight.constant = CGFloat(140 * self.vm.arrEventMyAgenda.count + 2)
        
        self.roundTablesOneOnOneTableViewHeight.constant = CGFloat(500 * self.vm.arrEventOneOnOneRoundTable.count)
        self.roundTablesRTTableViewHeight.constant = CGFloat(500 * self.vm.arrEventRTRoundTable.count)
        self.roundTablesBoardroomTableViewHeight.constant = CGFloat(600 * self.vm.arrEventBoardroomRoundTable.count)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func configUI() {
        sponsorsCollectionViewHeight.constant = 0
        speakersTableViewHeight.constant = 0
        networkingTableViewHeight.constant = 0
        agendaTableviewHeight.constant = 0
        myAgendaTableviewHeight.constant = 0
        roundTablesOneOnOneTableViewHeight.constant = 0
        roundTablesBoardroomTableViewHeight.constant = 0
        roundTablesRTTableViewHeight.constant = 0
        
        
        backBtnView.addCornerRadius(radius: 4)
        favouriteBtnView.addCornerRadius(radius: 4)
        
        mainView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
        
        eventLogoView.addCornerRadius(radius: 4)
        eventLogoView.addViewShadow(offSet: 0.5, color: .lightGray)
        
        calendarView.addCornerRadius(radius: 4)
        calendarView.addViewShadow(offSet: 0.5, color: .lightGray)
        
        btnRegister.addCornerRadius(radius: 4)
        btnJoinEvent.addCornerRadius(radius: 4)
        
        btnLinkedIn.layer.cornerRadius = btnLinkedIn.frame.size.width/2
        btnTwitter.layer.cornerRadius = btnTwitter.frame.size.width/2
        btnFacebook.layer.cornerRadius = btnFacebook.frame.size.width/2
        btnInstagram.layer.cornerRadius = btnInstagram.frame.size.width/2
        
        featuredScheduleDetailView.addCornerRadius(radius: 9)
        
        bgviewSort.addViewShadow(offSet: 0.5, color: .lightGray)
        
        boothBgView.addCornerRadius(radius: 7)
        boothBgImage.addCornerRadius(radius: 7)
        boothLogoImage.addCornerRadius(radius: 5)
        
        btnAddSessionAgenda.addCornerRadius(radius: 4)
        viewAccepted.layer.cornerRadius = viewAccepted.frame.size.width/2
        viewPending.layer.cornerRadius = viewPending.frame.size.width/2
        viewDeclined.layer.cornerRadius = viewDeclined.frame.size.width/2
        
        btnCreateMeetingRT.addCornerRadius(radius: 4)
        
        btnAddSessionAgenda.addCornerRadius(radius: 4)
        
        roundTablesMeetingOptionView.addBottomShadow()
        
    }
    
    @IBAction func didTapOnBtnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapOnJoinBtn(_ sender: UIButton) {
        ApplicationServiceProvider.shared.pushToViewController(in: .Events, for: .LiveChatVC, from: self)
    }
    @IBAction func didTapOnRegisterBtn(_ sender: UIButton) {
        ApplicationServiceProvider.shared.pushToViewController(in: .Events, for: .RegisterVC, from: self)
    }
    @IBAction func didTapOnCreateMeetingRT(_ sender: UIButton) {
        CreateMeetingPopUp.instance.showCreateMeetingView(from: self)
    }
}

extension EventDetailVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == eventOptionCollectionView) {
            return vm.arrEventOptions.count
        } else if (collectionView == eventSponsorsCollectionView) {
            return vm.arrEventSponsors.count
        } else if (collectionView == featuredScheduleDatecollectionView) {
            return vm.arrFeaturedSchedule.count
        } else if (collectionView == roundTablesOptionCollectionView) {
            return vm.arrEventRoundTableOptions.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (collectionView == eventOptionCollectionView) {
            let cell: EventOptionCVC = eventOptionCollectionView.dequeueReusableCell(withReuseIdentifier: "EventOptionCVC", for: indexPath) as! EventOptionCVC
            cell.configCell(model: vm.arrEventOptions[indexPath.row])
            return cell
        } else if (collectionView == eventSponsorsCollectionView) {
            let cell: EventSponsorsCVC = eventSponsorsCollectionView.dequeueReusableCell(withReuseIdentifier: "EventSponsorsCVC", for: indexPath) as! EventSponsorsCVC
            cell.configCell(model: vm.arrEventSponsors[indexPath.row])
            return cell
        } else if (collectionView == featuredScheduleDatecollectionView) {
            let cell: FeaturedScheduleCVC = featuredScheduleDatecollectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedScheduleCVC", for: indexPath) as! FeaturedScheduleCVC
            cell.configCell(model: vm.arrFeaturedSchedule[indexPath.row])
            return cell
        } else if (collectionView == roundTablesOptionCollectionView) {
            let cell: RoundtablesOptionCVC = roundTablesOptionCollectionView.dequeueReusableCell(withReuseIdentifier: "RoundtablesOptionCVC", for: indexPath) as! RoundtablesOptionCVC
            cell.configCell(model: vm.arrEventRoundTableOptions[indexPath.row])
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == eventOptionCollectionView) {
            if let cell = eventOptionCollectionView.cellForItem(at: indexPath) as? EventOptionCVC {
                cell.buttonHighlight()
                eventOptionNavigation(clickedItem: vm.arrEventOptions[indexPath.row].key)
            }
        } else if (collectionView == roundTablesOptionCollectionView) {
            if let cell = roundTablesOptionCollectionView.cellForItem(at: indexPath) as? RoundtablesOptionCVC {
                cell.buttonHighlight()
                roundTableOptionNavigation(clickedOption: vm.arrEventRoundTableOptions[indexPath.row].key)
            }
        }

    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if (collectionView == eventOptionCollectionView) {
            if let cell = collectionView.cellForItem(at: indexPath) as? EventOptionCVC {
                cell.buttonRemoveHighlight()
            }
        }  else if (collectionView == roundTablesOptionCollectionView) {
            if let cell = collectionView.cellForItem(at: indexPath) as? RoundtablesOptionCVC {
                cell.buttonRemoveHighlight()
            }
        }

    }
    
    func roundTableOptionNavigation(clickedOption: EventRoundTableOptionKey) {
        switch clickedOption {
        case .All:
            roundTablesOneOnOneTableView.isHidden = false
            roundTablesRTTableView.isHidden = false
            roundTablesBoardroomTableView.isHidden = false
        case .OneOnOne:
            roundTablesOneOnOneTableView.isHidden = false
            roundTablesRTTableView.isHidden = true
            roundTablesBoardroomTableView.isHidden = true
        case .Roundtables:
            roundTablesOneOnOneTableView.isHidden = true
            roundTablesRTTableView.isHidden = false
            roundTablesBoardroomTableView.isHidden = true
        case .Boardroom:
            roundTablesOneOnOneTableView.isHidden = true
            roundTablesRTTableView.isHidden = true
            roundTablesBoardroomTableView.isHidden = false
        }
    }
    
    func eventOptionNavigation(clickedItem: EventOptionKey) {
        switch clickedItem {
        case .About:
            aboutStackView.isHidden = false
            speakersStackView.isHidden = true
            networkingStackView.isHidden = true
            agendaStackView.isHidden = true
            myAgendastackView.isHidden = true
            roundtablesStackView.isHidden = true
        case .Speakers:
            aboutStackView.isHidden = true
            speakersStackView.isHidden = false
            networkingStackView.isHidden = true
            agendaStackView.isHidden = true
            myAgendastackView.isHidden = true
            roundtablesStackView.isHidden = true
        case .Networking:
            aboutStackView.isHidden = true
            speakersStackView.isHidden = true
            networkingStackView.isHidden = false
            agendaStackView.isHidden = true
            myAgendastackView.isHidden = true
            roundtablesStackView.isHidden = true
        case .Agenda:
            aboutStackView.isHidden = true
            speakersStackView.isHidden = true
            networkingStackView.isHidden = true
            agendaStackView.isHidden = false
            myAgendastackView.isHidden = true
            roundtablesStackView.isHidden = true
        case .MyAgenda:
            aboutStackView.isHidden = true
            speakersStackView.isHidden = true
            networkingStackView.isHidden = true
            agendaStackView.isHidden = true
            myAgendastackView.isHidden = false
            roundtablesStackView.isHidden = true
        case .Roundtables:
            aboutStackView.isHidden = true
            speakersStackView.isHidden = true
            networkingStackView.isHidden = true
            agendaStackView.isHidden = true
            myAgendastackView.isHidden = true
            roundtablesStackView.isHidden = false
        }
    }
}

// MARK: - CollectionView Flowlayout

extension EventDetailVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (collectionView == eventOptionCollectionView) {
            return CGSize(width: 100, height: 30)
        } else if (collectionView == eventSponsorsCollectionView) {
            let width = eventSponsorsCollectionView.frame.width / 2
//            let height = width
            return CGSize(width: width, height: 50)
        } else if (collectionView == featuredScheduleDatecollectionView) {
            return CGSize(width: 120, height: 30)
        }  else if (collectionView == roundTablesOptionCollectionView) {
            return CGSize(width: 80, height: 30)
        }
        return CGSize()
    }
}

extension EventDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == speakersTableView) {
            return vm.arrEventSpeakers.count
        } else if (tableView == networkingTableView) {
            return vm.arrEventNetworking.count
        } else if (tableView == AgendaTableView) {
            return vm.arrEventAgenda.count
        } else if (tableView == myAgendaTableView) {
            return vm.arrEventMyAgenda.count
        } else if (tableView == roundTablesOneOnOneTableView) {
            return vm.arrEventOneOnOneRoundTable.count
        } else if (tableView == roundTablesRTTableView) {
            return vm.arrEventRTRoundTable.count
        } else if (tableView == roundTablesBoardroomTableView) {
            return vm.arrEventBoardroomRoundTable.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == speakersTableView) {
            let cell = speakersTableView.dequeueReusableCell(withIdentifier: "SpeakersTVC", for: indexPath) as! SpeakersTVC
            cell.configCell(model: vm.arrEventSpeakers[indexPath.row])
            return cell
        } else if (tableView == networkingTableView) {
            let cell = networkingTableView.dequeueReusableCell(withIdentifier: "EventNetworkingTVC", for: indexPath) as! EventNetworkingTVC
            cell.configCell(model: vm.arrEventNetworking[indexPath.row])
            return cell
        } else if (tableView == AgendaTableView) {
            let cell = AgendaTableView.dequeueReusableCell(withIdentifier: "AgendaTVC", for: indexPath) as! AgendaTVC
            cell.configCell(model: vm.arrEventAgenda[indexPath.row])
            return cell
        } else if (tableView == myAgendaTableView) {
            let cell = myAgendaTableView.dequeueReusableCell(withIdentifier: "MyAgendaTVC", for: indexPath) as! MyAgendaTVC
            cell.configCell(model: vm.arrEventMyAgenda[indexPath.row])
            return cell
        } else if (tableView == roundTablesOneOnOneTableView) {
            let cell = roundTablesOneOnOneTableView.dequeueReusableCell(withIdentifier: "RoundTablesOneOnOneTVC", for: indexPath) as! RoundTablesOneOnOneTVC
            cell.configCell(model: vm.arrEventOneOnOneRoundTable[indexPath.row])
            return cell
        } else if (tableView == roundTablesRTTableView) {
            let cell = roundTablesRTTableView.dequeueReusableCell(withIdentifier: "RoundTablesRTTVC", for: indexPath) as! RoundTablesRTTVC
            cell.configCell(model: vm.arrEventRTRoundTable[indexPath.row])
            return cell
        } else if (tableView == roundTablesBoardroomTableView) {
            let cell = roundTablesBoardroomTableView.dequeueReusableCell(withIdentifier: "RoundTablesBoardroomTVC", for: indexPath) as! RoundTablesBoardroomTVC
            cell.configCell(model: vm.arrEventBoardroomRoundTable[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension EventDetailVC: CreateMeetingPopUpDelegate {
    func btnOtherMeeting(action: String) {
        ApplicationServiceProvider.shared.pushToViewController(in: .Events, for: .CreateNewMeetingVC, from: self)
    }
}
