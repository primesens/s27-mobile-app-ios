//
//  NotificationsVM.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-13.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class NotificationsVM: NSObject {

    var arrNotifications : [Notifications] = []
    
    func getNotifications() {
        arrNotifications.append(Notifications(innerCellColor: "#F3F8FC", statusView: "Show", notificationImageView: UIImage(named: "Ellipse 77")!, notificationTitle: "Event", notificationSubTitle: "is live now", notificationMessage: "join with us", notificationTime: "15 min ago"))
        
        arrNotifications.append(Notifications(innerCellColor: "#F3F8FC", statusView: "Show", notificationImageView: UIImage(named: "Ellipse 77")!, notificationTitle: "Event", notificationSubTitle: "is live now", notificationMessage: "join with us", notificationTime: "15 min ago"))
        
        arrNotifications.append(Notifications(innerCellColor: "No", statusView: "Hide", notificationImageView: UIImage(named: "Ellipse 77")!, notificationTitle: "Jhon Doe", notificationSubTitle: "Messaged you", notificationMessage: "Hi, How are you", notificationTime: "15 min ago"))
        
        arrNotifications.append(Notifications(innerCellColor: "No", statusView: "Hide", notificationImageView: UIImage(named: "Ellipse 77")!, notificationTitle: "Event", notificationSubTitle: "is live now", notificationMessage: "join with us", notificationTime: "15 min ago"))
    }
}


struct Notifications {
    var innerCellColor : String
    var statusView : String
    var notificationImageView : UIImage!
    var notificationTitle : String
    var notificationSubTitle : String
    var notificationMessage : String
    var notificationTime : String
}
