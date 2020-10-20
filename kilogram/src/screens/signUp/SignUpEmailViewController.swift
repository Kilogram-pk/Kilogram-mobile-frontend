//
//  SignUpEmailViewController.swift
//  kilogram
//
//  Created by Apple on 14/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyRequest

class SignUpEmailViewController: UIViewController {
    
    @IBAction func nextBtn(_ sender: Any) {
        let parameters: [String: String] = [
            "emaila": "hak@embrace-it.com"
        ]
        
        let request = RestRequest(method: .get, url: "http://myApiCall/hello")
        
//        let url = URL(string: "https://hasnat.tk/api/auth/register")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
     
    }
    
    
    @IBAction func emailField(_ sender: UITextField) {
        print("sender", sender.text)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
