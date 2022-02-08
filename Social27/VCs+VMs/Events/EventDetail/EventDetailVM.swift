//
//  EventDetailVM.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-10.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class EventDetailVM: NSObject {

    var arrEventOptions : [EventOptions] = []
    var arrEventSponsors: [EventSponsors] = []
    var arrFeaturedSchedule: [FeaturedSchedule] = []
    var arrEventSpeakers: [EventSpeakers] = []
    var arrEventNetworking: [EventNetworking] = []
    var arrEventAgenda: [EventAgenda] = []
    var arrEventMyAgenda: [EventMyAgenda] = []
    var arrEventRoundTableOptions : [EventRoundTableOptions] = []
    var arrEventOneOnOneRoundTable: [EventOneOnOneRoundTable] = []
    var arrEventRTRoundTable: [EventRTRoundTable] = []
    var arrEventBoardroomRoundTable: [EventBoardroomRoundTable] = []
    
    func getEventOptions() {
        arrEventOptions.append(EventOptions(key: .About))
        arrEventOptions.append(EventOptions(key: .Speakers))
        arrEventOptions.append(EventOptions(key: .Networking))
        arrEventOptions.append(EventOptions(key: .Agenda))
        arrEventOptions.append(EventOptions(key: .MyAgenda))
        arrEventOptions.append(EventOptions(key: .Roundtables))
    }
    
    func getEventSponsors() {
        arrEventSponsors.append(EventSponsors(sponsorImage: UIImage(named: "Mask Group 611")!))
        arrEventSponsors.append(EventSponsors(sponsorImage: UIImage(named: "Mask Group 613")!))
        arrEventSponsors.append(EventSponsors(sponsorImage: UIImage(named: "Mask Group 614")!))
        arrEventSponsors.append(EventSponsors(sponsorImage: UIImage(named: "Mask Group 615")!))
        arrEventSponsors.append(EventSponsors(sponsorImage: UIImage(named: "Mask Group 616")!))
        arrEventSponsors.append(EventSponsors(sponsorImage: UIImage(named: "Mask Group 617")!))
        arrEventSponsors.append(EventSponsors(sponsorImage: UIImage(named: "Mask Group 617")!))
    }
    
    func getFeaturedSchedule() {
        arrFeaturedSchedule.append(FeaturedSchedule(date: "October 25(1)"))
        arrFeaturedSchedule.append(FeaturedSchedule(date: "October 25(2)"))
    }
    
    func getEventSpeakers() {
        arrEventSpeakers.append(EventSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik Chandhoke", position: "President Of TIFF"))
        arrEventSpeakers.append(EventSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik Chandhoke", position: "President Of TIFF"))
        arrEventSpeakers.append(EventSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik Chandhoke", position: "President Of TIFF"))
        arrEventSpeakers.append(EventSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik Chandhoke", position: "President Of TIFF"))
    }
    
    func getEventNetworking() {
        arrEventNetworking.append(EventNetworking(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik Chandhoke", position: "President Of TIFF"))
        arrEventNetworking.append(EventNetworking(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik Chandhoke", position: "President Of TIFF"))
        arrEventNetworking.append(EventNetworking(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik Chandhoke", position: "President Of TIFF"))
        arrEventNetworking.append(EventNetworking(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik Chandhoke", position: "President Of TIFF"))
    }
    
    func getEventAgenda() {
        arrEventAgenda.append(EventAgenda(date: "12/09/2020", time: "10.00 AM - 12.00 PM", title: "Talent Strategy & Management", sessionNumber: "Session 1"))
        arrEventAgenda.append(EventAgenda(date: "12/09/2020", time: "10.00 AM - 12.00 PM", title: "Talent Strategy & Management", sessionNumber: "Session 1"))
        arrEventAgenda.append(EventAgenda(date: "12/09/2020", time: "10.00 AM - 12.00 PM", title: "Talent Strategy & Management", sessionNumber: "Session 1"))
        arrEventAgenda.append(EventAgenda(date: "12/09/2020", time: "10.00 AM - 12.00 PM", title: "Talent Strategy & Management", sessionNumber: "Session 1"))
    }
    
    func getEventMyAgenda() {
        arrEventMyAgenda.append(EventMyAgenda(date: "12/09/2020", time: "10.00 AM - 12.00 PM", title: "Talent Strategy & Management", sessionDetail: "Training Delivery & Facilitation"))
        arrEventMyAgenda.append(EventMyAgenda(date: "12/09/2020", time: "10.00 AM - 12.00 PM", title: "Talent Strategy & Management", sessionDetail: "Training Delivery & Facilitation"))
        arrEventMyAgenda.append(EventMyAgenda(date: "12/09/2020", time: "10.00 AM - 12.00 PM", title: "Talent Strategy & Management", sessionDetail: "Training Delivery & Facilitation"))
        arrEventMyAgenda.append(EventMyAgenda(date: "12/09/2020", time: "10.00 AM - 12.00 PM", title: "Talent Strategy & Management", sessionDetail: "Training Delivery & Facilitation"))
    }
    
    func getEventRoundTableOptions() {
        arrEventRoundTableOptions.append(EventRoundTableOptions(key: .All))
        arrEventRoundTableOptions.append(EventRoundTableOptions(key: .OneOnOne))
        arrEventRoundTableOptions.append(EventRoundTableOptions(key: .Roundtables))
        arrEventRoundTableOptions.append(EventRoundTableOptions(key: .Boardroom))
    }
    
    func getEventOneOnOneRoundTable() {
        arrEventOneOnOneRoundTable.append(EventOneOnOneRoundTable(topic: "Topic: Meeting Hosted By Event Owner....", datAndTime: "Wed, Jun 4 01:00 PM - 01:15 PM PST"))
        arrEventOneOnOneRoundTable.append(EventOneOnOneRoundTable(topic: "Topic: Meeting Hosted By Event Owner....", datAndTime: "Wed, Jun 4 01:00 PM - 01:15 PM PST"))
        arrEventOneOnOneRoundTable.append(EventOneOnOneRoundTable(topic: "Topic: Meeting Hosted By Event Owner....", datAndTime: "Wed, Jun 4 01:00 PM - 01:15 PM PST"))
    }
    
    func getEventRTRoundTable() {
        arrEventRTRoundTable.append(EventRTRoundTable(topic: "Topic: Meeting Hosted By Event Owner....", datAndTime: "Wed, Jun 4 01:00 PM - 01:15 PM PST"))
        arrEventRTRoundTable.append(EventRTRoundTable(topic: "Topic: Meeting Hosted By Event Owner....", datAndTime: "Wed, Jun 4 01:00 PM - 01:15 PM PST"))
        arrEventRTRoundTable.append(EventRTRoundTable(topic: "Topic: Meeting Hosted By Event Owner....", datAndTime: "Wed, Jun 4 01:00 PM - 01:15 PM PST"))
    }
    
    func getEventBoardroomRoundTable() {
        arrEventBoardroomRoundTable.append(EventBoardroomRoundTable(topic: "Topic: Meeting Hosted By Event Owner....", datAndTime: "Wed, Jun 4 01:00 PM - 01:15 PM PST"))
        arrEventBoardroomRoundTable.append(EventBoardroomRoundTable(topic: "Topic: Meeting Hosted By Event Owner....", datAndTime: "Wed, Jun 4 01:00 PM - 01:15 PM PST"))
        arrEventBoardroomRoundTable.append(EventBoardroomRoundTable(topic: "Topic: Meeting Hosted By Event Owner....", datAndTime: "Wed, Jun 4 01:00 PM - 01:15 PM PST"))
    }
}

struct EventOptions {
    var key: EventOptionKey
}

enum EventOptionKey: String {
    case About = "About"
    case Speakers = "Speakers"
    case Networking = "Networking"
    case Agenda = "Agenda"
    case MyAgenda = "My Agenda"
    case Roundtables = "Roundtables"
}

struct EventSponsors {
    var sponsorImage: UIImage
}

struct FeaturedSchedule {
    var date: String
}

struct EventSpeakers {
    var speakerImage: UIImage
    var name: String
    var position: String
}

struct EventNetworking {
    var speakerImage: UIImage
    var name: String
    var position: String
}

struct EventAgenda {
    var date: String
    var time: String
    var title: String
    var sessionNumber: String
}

struct EventMyAgenda {
    var date: String
    var time: String
    var title: String
    var sessionDetail: String
}

struct EventRoundTableOptions {
    var key: EventRoundTableOptionKey
}

enum EventRoundTableOptionKey: String {
    case All = "All"
    case OneOnOne = "1 on 1 (1)"
    case Roundtables = "Roundtables"
    case Boardroom = "Boardroom"
}

struct EventOneOnOneRoundTable {
    var topic: String
    var datAndTime: String
}

struct EventRTRoundTable {
    var topic: String
    var datAndTime: String
}

struct EventBoardroomRoundTable {
    var topic: String
    var datAndTime: String
}
