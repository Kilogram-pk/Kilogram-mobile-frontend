//
//  SignUpEmailViewController.swift
//  kilogram
//
//  Created by Apple on 14/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//https://hasnat.tk/api/auth/register

import UIKit
import Networking

class SignUpEmailViewController: UIViewController {
    
    var email: String = "";
    var error: Bool = false;
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var validationHeight: NSLayoutConstraint!
    @IBOutlet weak var buttonTopConstant: NSLayoutConstraint!
    @IBOutlet weak var emailTextField: TextFieldController!
    
    var _validation = validation()
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let isValid = _validation.isValidEmail(email)
        print("isInvalid", isValid)
        if(!isValid){
            displayError()
        } else {
            let networking = Networking(baseURL: "https://hasnat.tk/api")
            networking.post("/auth/register", parameters: ["email" : email]) { result in
               // Successfull post using `application/json` as `Content-Type`
                switch result {
                case .success(let response):
                    print("success", response.data)
                    let json = response.dictionaryBody
                    print("json**", response.statusCode)
                    let arrayBody = response.arrayBody
                    print("headers***", arrayBody)
                    
                case .failure(let response):
                    
                    let errorCode: Int = response.error.code
                    if (errorCode == 422) {
                        self.displayError()
                    }
                }

            }
            print("going ahead")
        }
     
    }
    
    
    @IBAction func emailField(_ sender: UITextField) {
        if(error){
            resetError()
        }
        email = sender.text!
    }
    
    func displayError() {
        error = true
        errorLabel.text = "Please enter a valid email address"
        errorLabel.isHidden = false
        errorLabel.font = UIFont(name: errorLabel.font.fontName, size: 14)
                    errorLabel.textColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.7)
        buttonTopConstant.constant = 18
        emailTextField.layer.borderWidth = 1;
        emailTextField.layer.borderColor = CGColor(srgbRed: 255/255, green: 0/255, blue: 0/255, alpha: 0.7)
    }
    
    func resetError() {
        errorLabel.font = UIFont(name: "SanFranciscoText-Medium", size: 0)
        validationHeight.constant = 0;
        buttonTopConstant.constant = 7.5
        error = false
        emailTextField.layer.borderColor = CGColor(srgbRed: 199/255, green: 199/255, blue: 205/255, alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validationHeight.constant = 0;
        errorLabel.font = UIFont(name: "SanFranciscoText-Medium", size: 0)
        let color =  errorLabel.layer.borderColor;
        print(color! as CGColor)
        // Do any additional setup after loading the view.
    }
    
}
