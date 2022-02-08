//
//  NetworkVM.swift
//  Social27
//
//  Created by Gautham Sritharan on 2021-12-06.
//  Copyright © 2021 PrimeSens LLC. All rights reserved.
//

import UIKit

class NetworkVM: NSObject {
    var arrNetworks : [Network] = []
    var arrHelloWroldSpeakers: [HelloWorldSpeakers] = []
    
    func getNetwork() {
        arrNetworks.append(Network(bgImage: UIImage(named: "2Capture")!, name: "Paul Turzio"))
        arrNetworks.append(Network(bgImage: UIImage(named: "3Capture")!, name: "Paul Turzio"))
        arrNetworks.append(Network(bgImage: UIImage(named: "2Capture")!, name: "Paul Turzio"))
        arrNetworks.append(Network(bgImage: UIImage(named: "3Capture")!, name: "Paul Turzio"))
        arrNetworks.append(Network(bgImage: UIImage(named: "2Capture")!, name: "Paul Turzio"))
        arrNetworks.append(Network(bgImage: UIImage(named: "3Capture")!, name: "Paul Turzio"))
        
    }
    
    func getHelloWorldSpeaker() {
        arrHelloWroldSpeakers.append(HelloWorldSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik Chandhoke", position: "President Of TIFF", introVideo: "a"))
        arrHelloWroldSpeakers.append(HelloWorldSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik Chandhoke", position: "President Of TIFF", introVideo: "a"))
        arrHelloWroldSpeakers.append(HelloWorldSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik Chandhoke", position: "President Of TIFF", introVideo: "a"))
    }
}

struct Network {
    var bgImage: UIImage
    var name: String
}

struct HelloWorldSpeakers {
    var speakerImage: UIImage
    var name: String
    var position: String
    var introVideo: String
}
