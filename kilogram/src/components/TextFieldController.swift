//
//  TextFieldController.swift
//  kilogram
//
//  Created by Apple on 29/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class TextFieldController: UITextField {
        
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        self.layer.cornerRadius = 5
    }
}
