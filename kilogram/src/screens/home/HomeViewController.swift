//
//  HomeViewController.swift
//  kilogram
//
//  Created by Apple on 04/10/2020.
//  Copyright © 2020 Apple. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    let colors = [UIColor.red, UIColor.blue, UIColor.green, UIColor.yellow]
    var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0..<colors.count {
            print("index", index)
            frame.origin.x = scrollView.frame.size.width * CGFloat(index)
            frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            
            
            let subView = UIView(frame: frame)
            addChildVC(vcView: subView)
            subView.backgroundColor = colors[index]
            scrollView.addSubview(subView)
            
        }
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(colors.count), height: scrollView.frame.size.height)
        
    }
    
    func addChildVC(vcView: UIView){
        
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let testVC = storyboard.instantiateViewController(withIdentifier: "Main") as! UIViewController
        
        testVC.view.frame = vcView.bounds
        vcView.addSubview(testVC.view)
        self.addChild(testVC)
        testVC.didMove(toParent: self)
    }
    
}
