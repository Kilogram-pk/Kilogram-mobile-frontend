//
//  SignUp.swift
//  kilogram
//
//  Created by Apple on 14/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class SignUp: UIViewController {
    
    var phoneNumber: NSString = "";
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet var button: UIView!
    @IBOutlet var validationHeight: NSLayoutConstraint!
    @IBOutlet weak var buttonTopConstant: NSLayoutConstraint!
    
    @IBAction func onPhoneChanged(_ sender: UITextField) {
        phoneNumber = sender.text as! NSString
    }
    
    
    @IBAction func onButtonPress(_ sender: UIButton) {
        print("****pH", phoneNumber)
        if(phoneNumber.length < 5){
            errorLabel.text = "Looks like your phone number maybe incorrect.\nPlease try entering your full number, including the country code."
            errorLabel.isHidden = false
            errorLabel.textColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.7)
            errorLabel.font = UIFont(name: errorLabel.font.fontName, size: 14)
//            validationHeight.constant = 30
            buttonTopConstant.constant = 18
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validationHeight.constant = 0
        errorLabel.font = UIFont(name: "SanFranciscoText-Medium", size: 0)
    }

}
