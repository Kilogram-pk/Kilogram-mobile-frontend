//
//  EmailConfirmationViewController.swift
//  kilogram
//
//  Created by Apple on 24/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class EmailConfirmationViewController: UIViewController {
    var userEmail = "";
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBAction func onCodeEdit(_ sender: Any) {
    }
    @IBOutlet weak var buttonTopConstant: NSLayoutConstraint!
    @IBOutlet weak var validationHeight: NSLayoutConstraint!
    @IBOutlet weak var codeTextField: UITextField!
    
    var error: Bool = false;
    
     func displayError() {
           error = true
           errorLabel.text = "Please enter a valid email address"
           errorLabel.isHidden = false
           errorLabel.font = UIFont(name: errorLabel.font.fontName, size: 14)
                       errorLabel.textColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.7)
           buttonTopConstant.constant = 18
           codeTextField.layer.borderWidth = 1;
           codeTextField.layer.borderColor = CGColor(srgbRed: 255/255, green: 0/255, blue: 0/255, alpha: 0.7)
       }
       
       func resetError() {
           errorLabel.font = UIFont(name: "SanFranciscoText-Medium", size: 0)
           validationHeight.constant = 0;
           buttonTopConstant.constant = 7.5
           error = false
           codeTextField.layer.borderColor = CGColor(srgbRed: 199/255, green: 199/255, blue: 205/255, alpha: 1)
       }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLabel.text = userEmail
        validationHeight.constant = 0;
        errorLabel.font = UIFont(name: "SanFranciscoText-Medium", size: 0)
        let color =  errorLabel.layer.borderColor;

        // Do any additional setup after loading the view.
    }

}
