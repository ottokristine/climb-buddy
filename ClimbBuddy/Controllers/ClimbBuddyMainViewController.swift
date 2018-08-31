//
//  ClimbBuddyMainViewController.swift
//  ClimbBuddy
//
//  Created by Kristine Otto on 8/30/18.
//  Copyright © 2018 Kristine Otto. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ClimbBuddyMainViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton(type: .roundedRect)
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
    }
    @IBAction func addClimbButton_Tap(_ sender: Any) {
        print("Tapped")
    }
}
