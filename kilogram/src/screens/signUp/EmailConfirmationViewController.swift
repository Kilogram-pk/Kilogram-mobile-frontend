//
//  EmailConfirmationViewController.swift
//  kilogram
//
//  Created by Apple on 24/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Networking

class EmailConfirmationViewController: UIViewController {
    var userEmail = "";
    var code: String = "";

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBAction func onCodeEdit(_ sender: UITextField) {
        if(error){
            self.resetError()
        }
        code = sender.text!
    }
    @IBOutlet weak var buttonTopConstant: NSLayoutConstraint!
    @IBOutlet weak var validationHeight: NSLayoutConstraint!
    @IBOutlet weak var codeTextField: UITextField!
    @IBAction func onButtonPressed(_ sender: UIButton) {
        print("in", code)
        if(code != "") {
            let networking = Networking(baseURL: "https://hasnat.tk/api")
            networking.post("/auth/verify-code", parameters: ["email" : userEmail, "verification_key": code]) { result in
                  switch result {
                  case .success (let response):
                    print("api result", response.statusCode)
                  case .failure(let response):
                      let errorCode: Int = response.error.code
                      if (errorCode == 401) {
                          self.displayError()
                      } else if (errorCode == 422) {
                        self.displayError()
                    }
                  }

              }
        }
    }
    
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
        // Do any additional setup after loading the view.
    }

}
