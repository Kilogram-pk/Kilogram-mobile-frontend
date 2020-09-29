//
//  ButtonController.swift
//  kilogram
//
//  Created by Apple on 29/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ButtonController: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
     required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
           self.layer.cornerRadius = 5
       }

}
