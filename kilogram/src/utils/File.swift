//
//  File.swift
//  kilogram
//
//  Created by Apple on 22/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import Foundation


class validation {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
