//
//  LoginViewController.swift
//  ClimbBuddy
//
//  Created by Kristine Otto on 9/6/18.
//  Copyright © 2018 Kristine Otto. All rights reserved.
//
import Foundation
import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class LoginViewController: UITableViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBSDKLoginButton(type: .system)
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile","email"]
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
    }
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("logged in")
        let canceledBool = result.isCancelled
        
        guard canceledBool != true else {
            print("User cancelled Facebook log in")
            return
        }
        
        let permissionDenied = !result.declinedPermissions.isEmpty
        guard permissionDenied != true else {
            print("Permission was denied")
            return
        }
        //let grantedPermissions = !result.grantedPermissions.isEmpty
        //let token = result.token!
        let request = FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name,last_name,email, picture.type(large)"], httpMethod: "GET")!
        request.start(completionHandler: { (requestResult, response, error) in
            if error == nil {
                if let responseDictionary = (response as? NSDictionary) {
                    let email = responseDictionary["email"] as! String
                    let firstName = responseDictionary["first_name"] as! String
                    let lastName = responseDictionary["last_name"] as! String
                    let pictDict =  responseDictionary["picture"] as? NSDictionary
                    let pictureData = pictDict?["data"] as? NSDictionary
                    let pictureUrl = pictureData?["url"] as! String
                    
                    UserDefaults.sharedInstance.loggedInUser = UserProfile(email: email, firstName: firstName, lastName: lastName, profilePictureURL: pictureUrl)
                    
                }
            }
            else{
                print(error!.localizedDescription)
            }
        })
        print("Access Granted")
    }
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logged out")
        UserDefaults.sharedInstance.loggedInUser = nil
    }
    @IBAction func addClimbButton_Tap(_ sender: Any) {
        print("Tapped")
    }
}

