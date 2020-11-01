//
//  createPasswordViewController.swift
//  kilogram
//
//  Created by Apple on 29/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class createPasswordViewController: UIViewController {

    @IBOutlet weak var checkbox: CheckBox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded", checkbox!.isChecked)
        // Do any additional setup after loading the view.
    }
    
    
}
