//
//  HomeVM.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-06.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class HomeVM: NSObject {
    
    var arrHappeningNow : [HappeningNow] = []
    var arrAttendies: [Attendies] = []
    var arrSpeakers: [Speakers] = []
    var arrSponsors: [Sponsors] = []
    
    var HomeCollectionViews : HomeCollectionViews = .HappeningNow
    
    func gethappeningNow() {
        arrHappeningNow.append(HappeningNow(bgImage: UIImage(named: "Group 256")!, eventName: "TIFF | Bell Digital Talks", eventTime: "Oct 3, 5:30PM PST"))
        arrHappeningNow.append(HappeningNow(bgImage: UIImage(named: "Group 256")!, eventName: "TIFF | Bell Digital Talks", eventTime: "Oct 3, 5:30PM PST"))
        arrHappeningNow.append(HappeningNow(bgImage: UIImage(named: "Group 256")!, eventName: "TIFF | Bell Digital Talks", eventTime: "Oct 3, 5:30PM PST"))
        arrHappeningNow.append(HappeningNow(bgImage: UIImage(named: "Group 256")!, eventName: "TIFF | Bell Digital Talks", eventTime: "Oct 3, 5:30PM PST"))
        arrHappeningNow.append(HappeningNow(bgImage: UIImage(named: "Group 256")!, eventName: "TIFF | Bell Digital Talks", eventTime: "Oct 3, 5:30PM PST"))
        arrHappeningNow.append(HappeningNow(bgImage: UIImage(named: "Group 256")!, eventName: "TIFF | Bell Digital Talks", eventTime: "Oct 3, 5:30PM PST"))
    }
    
    func getAttendies() {
        arrAttendies.append(Attendies(attendiesImage: UIImage(named: "Group 2899")!))
        arrAttendies.append(Attendies(attendiesImage: UIImage(named: "Group 2899")!))
        arrAttendies.append(Attendies(attendiesImage: UIImage(named: "Group 2899")!))
        arrAttendies.append(Attendies(attendiesImage: UIImage(named: "Group 2899")!))
        arrAttendies.append(Attendies(attendiesImage: UIImage(named: "Group 2899")!))
        arrAttendies.append(Attendies(attendiesImage: UIImage(named: "Group 2899")!))
    }
    
    func getSpeakers() {
        arrSpeakers.append(Speakers(speakerImage: UIImage(named: "2Capture")!))
        arrSpeakers.append(Speakers(speakerImage: UIImage(named: "3Capture")!))
        arrSpeakers.append(Speakers(speakerImage: UIImage(named: "5Capture")!))
        arrSpeakers.append(Speakers(speakerImage: UIImage(named: "6Capture")!))
        arrSpeakers.append(Speakers(speakerImage: UIImage(named: "7Capture")!))
        arrSpeakers.append(Speakers(speakerImage: UIImage(named: "8Capture")!))
    }
    
    func getSponsors() {
        arrSponsors.append(Sponsors(sponsorImage: UIImage(named: "Mask Group 611")!))
        arrSponsors.append(Sponsors(sponsorImage: UIImage(named: "Mask Group 613")!))
        arrSponsors.append(Sponsors(sponsorImage: UIImage(named: "Mask Group 614")!))
        arrSponsors.append(Sponsors(sponsorImage: UIImage(named: "Mask Group 615")!))
        arrSponsors.append(Sponsors(sponsorImage: UIImage(named: "Mask Group 616")!))
        arrSponsors.append(Sponsors(sponsorImage: UIImage(named: "Mask Group 617")!))
        arrSponsors.append(Sponsors(sponsorImage: UIImage(named: "Mask Group 617")!))
    }

}

struct HappeningNow {
    var bgImage: UIImage
    var eventName: String
    var eventTime: String
}

struct Attendies {
    var attendiesImage: UIImage
}

struct Speakers {
    var speakerImage: UIImage
}

struct Sponsors {
    var sponsorImage: UIImage
}

 
