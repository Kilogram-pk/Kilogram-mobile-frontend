//
//  TextFieldController.swift
//  kilogram
//
//  Created by Apple on 29/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class TextFieldController: UITextField {
    
    let padding = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 0)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let originalRect = super.clearButtonRect(forBounds: bounds)
        //move 10 points left
        return originalRect.offsetBy(dx: -20, dy: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.clearButtonMode = .whileEditing
        self.backgroundColor = UIColor(red: 250, green: 250, blue: 250)
        self.textColor = UIColor(red: 38, green: 38, blue: 38)
        self.font = UIFont(name: "SanFranciscoText-Medium", size: 15.0)
        self.minimumFontSize = 20
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!,
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 156, green: 156, blue: 156),
                     NSAttributedString.Key.font: UIFont(name: "SanFranciscoText-Medium", size: 15.0)
        
        ])

    }
    
}
