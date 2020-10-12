import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController {
    @IBOutlet weak var tabView: UIView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backToLogin: UILabel!
    
    lazy var viewControllers: [UIViewController] = {
        var viewControllers = [UIViewController]()
        for _ in 0 ..< 1 {
            viewControllers.append(makeChildViewController())
        }
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        viewControllers.append(storyboard.instantiateViewController(withIdentifier: "phoneNumber") as! UIViewController)  

        return viewControllers
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = "Enter your username or email address and we'll\nsend you a link to get back into your account."
        
        self.dataSource = self
        self.isScrollEnabled = false

        // Create bar
        let bar = TMBar.ButtonBar()
        
        bar.backgroundColor = .clear
        bar.layout.transitionStyle = .none // Customize
        tabView.tintColor = UIColor.red;
        
        bar.layout.contentMode = .fit
        bar.indicator.weight = .custom(value: 1.0)
        bar.indicator.transitionStyle = .none
        bar.indicator.overscrollBehavior = .none
        
        
        bar.indicator.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
        bar.layout.view.backgroundColor = UIColor.white //changes the background color of tabbar
        
        bar.scrollMode = .none
        bar.indicator.overscrollBehavior = .none
        
        
        bar.buttons.customize {
            (button) in
            button.tintColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
            button.selectedTintColor = UIColor.black
            button.backgroundColor = UIColor.white
            button.font = UIFont.init(name: "SanFranciscoText-Medium", size: 19)!
        }
        

        // Add to view
        addBar(bar, dataSource: self, at: .custom(view: tabView, layout: nil))
    }
    
    func makeChildViewController() -> UIViewController {
          let storyboard = UIStoryboard(name: "Main", bundle: .main)
          return storyboard.instantiateViewController(withIdentifier: "New") as! UIViewController
      }
    
    //https://github.com/uias/Pageboy#didscrolltopage
   override func pageboyViewController(_ pageboyViewController: PageboyViewController,
    didScrollToPageAt index: Int,
    direction: NavigationDirection,
    animated: Bool) {
        print("success", index)
    }

}


extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        print("index is updated", index)
        return viewControllers[index]
    }

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        if index == 0 {
            return TMBarItem(title: "Username")
        } else {
            return  TMBarItem(title: "Phone")
        }
        
    }
    
}
