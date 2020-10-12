//
//  ForgotPassPhone.swift
//  kilogram
//
//  Created by Apple on 12/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import FlagPhoneNumber

class ForgotPassPhone: UIViewController {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var buttonContainer: ButtonController!
    @IBOutlet weak var lableContainer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        container.frame = CGRect(x: 0, y: 350, width: UIScreen.main.bounds.width - 40, height: 300)
        
        let phoneNumberTextField = FPNTextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40 , height: 45))
        phoneNumberTextField.setFlag(key: .PK)
        buttonContainer.frame = CGRect(x: 0, y: 65, width: UIScreen.main.bounds.width - 40, height: 45)
        lableContainer.frame = CGRect(x: 0, y: 115, width: 100, height: 45)
        buttonContainer.center.x = self.view.center.x
        lableContainer.center.x = self.view.center.x
        
        phoneNumberTextField.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 370)
        phoneNumberTextField.backgroundColor = UIColor(red: CGFloat(250.0/255.0), green: CGFloat(250.0/255.0), blue: CGFloat(250.0/255.0), alpha: CGFloat(1.0))
        phoneNumberTextField.layer.cornerRadius = 5
        phoneNumberTextField.layer.borderWidth = 1.5
        phoneNumberTextField.layer.borderColor = CGColor(srgbRed: CGFloat(212.0/255.0), green: CGFloat(212.0/255.0), blue: CGFloat(212.0/255.0), alpha: CGFloat(1.0))
        phoneNumberTextField.flagButton.backgroundColor = UIColor(red: CGFloat(250.0/255.0), green: CGFloat(250.0/255.0), blue: CGFloat(250.0/255.0), alpha: CGFloat(1.0))
        phoneNumberTextField.flagButton.tintColor = UIColor(red: CGFloat(250.0/255.0), green: CGFloat(250.0/255.0), blue: CGFloat(250.0/255.0), alpha: CGFloat(1.0))
        phoneNumberTextField.flagButton.
        self.view.addSubview(phoneNumberTextField)
    }

}
