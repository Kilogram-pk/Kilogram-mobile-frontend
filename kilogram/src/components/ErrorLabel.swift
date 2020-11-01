//
//  ErrorLabel.swift
//  kilogram
//
//  Created by Apple on 01/11/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ErrorLabel: UILabel {
    
    var isVisible: Bool = false;
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.font = UIFont(name: self.font.fontName, size: 0)
    }
    
    func displayError(error: String) -> Void {
        self.text = error
        self.isHidden = false
        self.textColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.7)
        self.font = UIFont(name: self.font.fontName, size: 14)
        self.isVisible = true
    }
    
    func clearError() -> Void {
         self.font = UIFont(name: "SanFranciscoText-Medium", size: 0)
        self.isHidden = true
        self.isVisible = false
    }
}
