//
//  CheckBox.swift
//  kilogram
//
//  Created by Apple on 29/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    let checkedImage = UIImage(named: "goBack")! as UIImage
    let uncheckedImage = UIImage(named: "kilogram")! as UIImage
    
     // Bool property
      var isChecked: Bool = false {
          didSet {
              if isChecked == true {
                  self.setImage(checkedImage, for: UIControl.State.normal)
              } else {
                  self.setImage(uncheckedImage, for: UIControl.State.normal)
              }
          }
      }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.isChecked = true
    }
    
    public func checkBoxchanged(isChecked: String){}
    
    @objc
    func buttonClicked(sender: UIButton) {
        print("changing self", isChecked)
        if sender == self {
            isChecked = !isChecked
        }
    }

}
