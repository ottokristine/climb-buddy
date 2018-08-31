//
//  UserDefaults.swift
//  ClimbBuddy
//
//  Created by Kristine Otto on 8/31/18.
//  Copyright © 2018 Kristine Otto. All rights reserved.
//

import Foundation

class UserDefaults {
    static let sharedInstance = UserDefaults()
    var loggedInUser: UserProfile?
}
