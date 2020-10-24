//
//  File.swift
//  kilogram
//
//  Created by Apple on 22/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation
import UIKit

class validation {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func displayError(textField: UITextField) -> Void {
        textField.layer.borderWidth = 1;
        textField.layer.borderColor = CGColor(srgbRed: 255/255, green: 0/255, blue: 0/255, alpha: 0.7)
    }
}
