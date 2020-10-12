//
//  ForgotPassEmail.swift
//  kilogram
//
//  Created by Apple on 12/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class ForgotPassEmail: UIViewController {
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var buttonContainer: ButtonController!
    @IBOutlet weak var labelContainer: UILabel!
    @IBOutlet weak var texFieldContainer: TextFieldController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        container.frame = CGRect(x: 0, y: 350, width: UIScreen.main.bounds.width - 40, height: 300)
        texFieldContainer.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40 , height: 45)
        buttonContainer.frame = CGRect(x: 0, y: 65, width: UIScreen.main.bounds.width - 40, height: 45)
        labelContainer.frame = CGRect(x: 0, y: 115, width: 100, height: 45)
        texFieldContainer.center.x = self.view.center.x
        buttonContainer.center.x = self.view.center.x
        labelContainer.center.x = self.view.center.x
    }

}
//
//In iOS 11 and later, use the directionalLayoutMargins property to specify layout margins instead of this property. The leading and trailing edge insets in the directionalLayoutMargins property are synchronized with the left and right insets in this property. For example, setting the leading directional edge inset to 20 points causes the left inset of this property to be set to 20 points on a system with a left-to-right language.
//For the root view of a view controller, the default value of this property reflects the system minimum margins and safe area insets. For other subviews in your view hierarchy, the default layout margins are normally 8 points on each side, but the values may be greater if the view is not fully inside the safe area or if the preservesSuperviewLayoutMargins property is true.
//This property specifies the desired amount of space (measured in points) between the edge of the view and any subviews. Auto layout uses your margins as a cue for placing content. For example, if you specify a set of horizontal constraints using the format string “|-[subview]-|”, the left and right edges of the subview are inset from the edge of the superview by the corresponding layout margins. When the edge of your view is close to the edge of the superview and the preservesSuperviewLayoutMargins property is true, the actual layout margins may be increased to prevent content from overlapping the superview’s margins.
