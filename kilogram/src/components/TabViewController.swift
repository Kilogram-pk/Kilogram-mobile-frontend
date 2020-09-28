import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController {
    @IBOutlet weak var tabView: UIView!
    
    lazy var viewControllers: [UIViewController] = {
        var viewControllers = [UIViewController]()
        for _ in 0 ..< 2 {
            viewControllers.append(makeChildViewController())
        }
        return viewControllers
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self

        // Create bar
        let bar = TMBar.ButtonBar()
        
        bar.backgroundColor = .clear
        bar.layout.transitionStyle = .snap // Customize
        tabView.tintColor = UIColor.red;
        
        bar.layout.contentMode = .fit
        bar.indicator.weight = .light
        
        bar.indicator.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
        bar.layout.view.backgroundColor = UIColor.white //changes the background color of tabbar
        
        
        bar.buttons.customize {
            (button) in
            button.tintColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 0.5)
            button.selectedTintColor = UIColor.black
            button.backgroundColor = UIColor.white
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
