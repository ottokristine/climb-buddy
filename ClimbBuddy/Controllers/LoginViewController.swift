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

class LoginViewController: UIViewController /*,FBSDKLoginButtonDelegate*/ {
    
    @IBOutlet weak var FacebookLogInButton: FBSDKButton!
    
    override func viewDidLoad() {
        
        if(FBSDKAccessToken.current() == nil){
            print("Not logged in ")
            FacebookLogInButton.setTitle("Log In", for: .normal)
        }else{
            print("Logged in already")
            //FacebookLogInButton.titleLabel?.text = "Log Out"
            FacebookLogInButton.setTitle("Log Out", for: .normal)
        }
        
        /*let loginButton = FBSDKLoginButton(type: .system)
        loginButton.delegate = self
        loginButton.readPermissions = ["public_profile","email"]
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)*/
        super.viewDidLoad()
    }
    
    
    /*func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
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
    }*/
    @IBAction func LoginButton_Tap(_ sender: Any) {
        if FacebookLogInButton.titleLabel?.text == "Log In" {
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
                        //self.reloadInputViews()
                        self.viewDidLoad()
                    }
                }
            }
        }
        else {
            UserDefaults.sharedInstance.loggedInUser = nil
            FBSDKLoginManager().logOut()
            //self.reloadInputViews()
            self.viewDidLoad()
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
}

