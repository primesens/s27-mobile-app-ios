//
//  EvenetsVM.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-07.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class EvenetsVM: NSObject {
    var arrEvents : [Events] = [] 

    func getEvents() {
        arrEvents.append(Events(eventImage: UIImage(named: "Group 256")!, eventName: "TIFF | Bell Digital Talks", eventTime: "Oct 3, 5:30PM (UTC +5:00)", eventLocation: "Islamabad, Karachi", eventDate: "30", eventMonth: "AUG", key: .One))
        arrEvents.append(Events(eventImage: UIImage(named: "Group 256")!, eventName: "TIFF | Bell Digital Talks", eventTime: "Oct 3, 5:30PM (UTC +5:00)", eventLocation: "Islamabad, Karachi", eventDate: "30", eventMonth: "AUG", key: .Two))
        arrEvents.append(Events(eventImage: UIImage(named: "Group 256")!, eventName: "TIFF | Bell Digital Talks", eventTime: "Oct 3, 5:30PM (UTC +5:00)", eventLocation: "Islamabad, Karachi", eventDate: "30", eventMonth: "AUG", key: .Three))
    }
}

struct Events {
    var eventImage: UIImage
    var eventName: String
    var eventTime: String
    var eventLocation: String
    var eventDate: String
    var eventMonth: String
    var key: EventsKey
}

enum EventsKey: String {
    case One = "TIFF | Bell Digital Talks"
    case Two = "TIFF | Bell Digital Talks 2"
    case Three = "TIFF | Bell Digital Talks 3"
}
