//
//  EditProfileVM.swift
//  Social27
//
//  Created by Gautham Sritharan on 2022-02-11.
//  Copyright © 2022 PrimeSens LLC. All rights reserved.
//

import UIKit

class EditProfileVM: NSObject {

    var arrSocialaccount : [SocialAccount] = []
    
    func getSocialAccounts() {
        arrSocialaccount.append(SocialAccount(SocialMediaImage: UIImage(named: "Group 191")!, email: "@john Jordan"))
        arrSocialaccount.append(SocialAccount(SocialMediaImage: UIImage(named: "Group 192")!, email: "@john Jordan"))
        arrSocialaccount.append(SocialAccount(SocialMediaImage: UIImage(named: "Group 3558")!, email: "@john Jordan"))
        
    }
}

struct SocialAccount {
    var SocialMediaImage: UIImage
    var email: String
}
