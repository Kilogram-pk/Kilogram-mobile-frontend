//
//  ViewController.swift
//  kilogram
//
//  Created by Apple on 23/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {
    
    var email: String = "";
    var password: String = "";
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func didFinishEditingEmail(_ sender: UITextField) {
        
        if(sender.text != nil) {
            email = sender.text!;
            isLoginAvailable()
        }
    }
    
    @IBAction func didFinishEditingPassword(_ sender: UITextField) {
        if(sender.text != nil) {
            password = sender.text!;
            isLoginAvailable()
        }
    }
    
    func createBottomText() {
        let attrs1 = [ NSAttributedString.Key.foregroundColor : UIColor.black,
                       NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 12.0)!]
        
        let attrs2 = [NSAttributedString.Key.foregroundColor : UIColor.lightGray,
                      NSAttributedString.Key.font: UIFont(name: "HelveticaNeue", size: 12.0)!]
        
        let attributedString1 = NSMutableAttributedString(string:" Sign Up", attributes:attrs1)
        
        let attributedString2 = NSMutableAttributedString(string:"Don't have an account?", attributes:attrs2)
        attributedString2.append(attributedString1);
        signUpButton.setAttributedTitle(attributedString2, for: .normal)
        
        //        bottomText.attributedText = attributedString2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fbLogin = FBLoginButton()
        fbLogin.center = CGPoint(x: UIScreen.main.bounds.width / 2 , y: UIScreen.main.bounds.height / 1.6)
        fbLogin.permissions = ["public_profile", "email"]
        fbLogin.delegate = self
        view.addSubview(fbLogin)
        createBottomText()
        loginButton.layer.cornerRadius = 5
        
        if let token = AccessToken.current, !token.isExpired {
            print("User already logged in ", AccessToken.current!)
            let request = GraphRequest(graphPath: "me", parameters: ["fields": "id, email, first_name, last_name"], tokenString: AccessToken.current?.tokenString, version: Settings.defaultGraphAPIVersion, httpMethod: HTTPMethod.get)
                   request.start { (connection, result, error) in
                       if let err = error {
                           print("Facebook graph request error: \(err)")
                       } else {
                           print("Facebook graph request successful!")

                           guard let json = result as? NSDictionary else { return }
                           if let email = json["email"] as? String {
                               print("\(email)")
                           }
                           if let firstName = json["first_name"] as? String {
                               print("\(firstName)")
                           }
                           if let lastName = json["last_name"] as? String {
                               print("\(lastName)")
                           }
                           if let id = json["id"] as? String {
                               print("\(id)")
                           }
                       }
                   }
        }
    }
    
    func isLoginAvailable() {
        print("checking if login is avail", email.count, password.count)
        if email.count > 0 && password.count > 0 {
            loginButton.backgroundColor = UIColor.black
        } else {
            loginButton.backgroundColor = UIColor(rgb: 0x000000)
        }
    }
    
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

extension ViewController: LoginButtonDelegate {
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("logout")
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        print("Login button pressed")
    }
}

