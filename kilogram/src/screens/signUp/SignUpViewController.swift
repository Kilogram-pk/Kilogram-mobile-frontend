//
//  SignUpViewController.swift
//  kilogram
//
//  Created by Apple on 29/09/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class SignUpViewController: TabmanViewController {
    @IBOutlet weak var tabView: UIView!
    
    lazy var viewControllers: [UIViewController] = {
        var viewControllers = [UIViewController]()
        for _ in 0 ..< 1 {
            viewControllers.append(makeChildViewController())
        }
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        viewControllers.append(storyboard.instantiateViewController(withIdentifier: "signUpEmail") as! UIViewController)
        
        return viewControllers
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.isScrollEnabled = false
        
        // Create bar
        let bar = TMBar.ButtonBar()
        
        bar.backgroundColor = .clear
        bar.layout.transitionStyle = .snap // Customize
        tabView.tintColor = UIColor.red;
        
        bar.layout.contentMode = .fit
        bar.indicator.weight = .light
        
        
        bar.indicator.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
        bar.layout.view.backgroundColor = UIColor.white //changes the background color of tabbar
        
        bar.scrollMode = .none
        bar.indicator.overscrollBehavior = .none
        
        
        bar.buttons.customize {
            (button) in
            button.tintColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
            button.selectedTintColor = UIColor.black
            button.backgroundColor = UIColor.white
            button.font = UIFont.init(name: "HelveticaNeue", size: 14)!
        }
        
        
        // Add to view
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
    }
    
    func makeChildViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: "signUpPhone") as! UIViewController
    }
    
    //https://github.com/uias/Pageboy#didscrolltopage
    override func pageboyViewController(_ pageboyViewController: PageboyViewController,
                                        didScrollToPageAt index: Int,
                                        direction: NavigationDirection,
                                        animated: Bool) {
        print("success", index)
    }
}

extension SignUpViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        if index == 0 {
            return TMBarItem(title: "Phone")
        } else {
            return  TMBarItem(title: "Email")
        }
    }
}
