//
//  ViewController.swift
//  kilogram
//
//  Created by Apple on 23/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var email: String = "";
    var password: String = "";
    
    @IBOutlet weak var loginButton: UIButton!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 5
        // Do any additional setup after loading the view.
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
