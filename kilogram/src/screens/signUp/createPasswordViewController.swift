//
//  createPasswordViewController.swift
//  kilogram
//
//  Created by Apple on 29/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class createPasswordViewController: UIViewController {

    var password: String = "";
    
    @IBOutlet weak var checkbox: CheckBox!
    @IBAction func onPassEdit(_ sender: UITextField) {
    }
    @IBAction func onNextPressed(_ sender: UIButton) {
    }
    
    var userName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded", checkbox!.isChecked)
        // Do any additional setup after loading the view.
    }
    
}
