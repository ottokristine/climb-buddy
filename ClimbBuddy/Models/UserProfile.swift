//
//  UserProfile.swift
//  ClimbBuddy
//
//  Created by Kristine Otto on 8/31/18.
//  Copyright © 2018 Kristine Otto. All rights reserved.
//

import Foundation
import UIKit

class UserProfile {
    let email: String
    let firstName: String
    let lastName: String
    let profilePictureURL: String
    
    init(email: String, firstName: String, lastName: String, profilePictureURL: String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.profilePictureURL = profilePictureURL
    }
    
    func createProfilePictureDataFromURL() -> UIImage{
    let url = URL(string: profilePictureURL)
    let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
    let profilePicture = UIImage(data: data!)
    return profilePicture!
    }
}
