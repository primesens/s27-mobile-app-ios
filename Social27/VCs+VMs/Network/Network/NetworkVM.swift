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
        arrHelloWroldSpeakers.append(HelloWorldSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik 1", position: "President Of TIFF", introVideo: "https://v.pinimg.com/videos/720p/77/4f/21/774f219598dde62c33389469f5c1b5d1.mp4", imageUrl: "https://i.pinimg.com/videos/thumbnails/originals/77/4f/21/774f219598dde62c33389469f5c1b5d1-00001.jpg"))
        arrHelloWroldSpeakers.append(HelloWorldSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik 2", position: "President", introVideo: "https://v.pinimg.com/videos/720p/77/4f/21/774f219598dde62c33389469f5c1b5d1.mp4", imageUrl: "https://i.pinimg.com/videos/thumbnails/originals/77/4f/21/774f219598dde62c33389469f5c1b5d1-00001.jpg"))
        arrHelloWroldSpeakers.append(HelloWorldSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik 3", position: "Presid TIFF", introVideo: "https://v.pinimg.com/videos/720p/77/4f/21/774f219598dde62c33389469f5c1b5d1.mp4", imageUrl: "https://i.pinimg.com/videos/thumbnails/originals/77/4f/21/774f219598dde62c33389469f5c1b5d1-00001.jpg"))
        arrHelloWroldSpeakers.append(HelloWorldSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik 1", position: "President Of TIFF", introVideo: "https://v.pinimg.com/videos/720p/77/4f/21/774f219598dde62c33389469f5c1b5d1.mp4", imageUrl: "https://i.pinimg.com/videos/thumbnails/originals/77/4f/21/774f219598dde62c33389469f5c1b5d1-00001.jpg"))
        arrHelloWroldSpeakers.append(HelloWorldSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik 2", position: "President", introVideo: "https://v.pinimg.com/videos/720p/77/4f/21/774f219598dde62c33389469f5c1b5d1.mp4", imageUrl: "https://i.pinimg.com/videos/thumbnails/originals/77/4f/21/774f219598dde62c33389469f5c1b5d1-00001.jpg"))
        arrHelloWroldSpeakers.append(HelloWorldSpeakers(speakerImage: UIImage(named: "Ellipse 77")!, name: "Pratik 3", position: "Presid TIFF", introVideo: "https://v.pinimg.com/videos/720p/77/4f/21/774f219598dde62c33389469f5c1b5d1.mp4", imageUrl: "https://i.pinimg.com/videos/thumbnails/originals/77/4f/21/774f219598dde62c33389469f5c1b5d1-00001.jpg"))
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
    var imageUrl: String
}
