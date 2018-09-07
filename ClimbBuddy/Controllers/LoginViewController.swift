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

class LoginViewController: UIViewController {
    
    @IBOutlet weak var FacebookLogInButton: FBSDKButton!
    
    override func viewDidLoad() {
        
        if(FBSDKAccessToken.current() == nil){
            print("Not logged in ")
            FacebookLogInButton.setTitle("Log In", for: .normal)
        }else{
            print("Logged in already")
            FacebookLogInButton.setTitle("Log Out", for: .normal)
        }
        
        super.viewDidLoad()
    }
    
    @IBAction func LoginButton_Tap(_ sender: Any) {
        if FacebookLogInButton.titleLabel?.text == "Log In" {
            logIn()
        }
        else {
            self.logOut()
        }
    }
    @IBAction func addClimbButton_Tap(_ sender: Any) {
        print("Tapped")
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    //everything works print the user data
                    if let responseDictionary = (result as? NSDictionary) {
                        let email = responseDictionary["email"] as! String
                        let firstName = responseDictionary["first_name"] as! String
                        let lastName = responseDictionary["last_name"] as! String
                        let pictDict =  responseDictionary["picture"] as? NSDictionary
                        let pictureData = pictDict?["data"] as? NSDictionary
                        let pictureUrl = pictureData?["url"] as! String
                    UserDefaults.sharedInstance.loggedInUser = UserProfile(email: email, firstName: firstName, lastName: lastName, profilePictureURL: pictureUrl)
                    }
                }
            })
        }
    }
    func logOut() {
        UserDefaults.sharedInstance.loggedInUser = nil
        FBSDKLoginManager().logOut()
        self.viewDidLoad()
    }
    
    func logIn() {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                // if user cancel the login
                if (result?.isCancelled)!{
                    return
                }
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                    self.viewDidLoad()
                }
            }
        }
    }
}

