import UIKit

final class MAPSMainNavigationController: UINavigationController {
    
    class func makeMainNavigationController() -> MAPSMainNavigationController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainNavigationController = storyboard.instantiateViewController(withIdentifier: "MAPSMainNavigationController") as? MAPSMainNavigationController
        let mainViewController = storyboard.instantiateViewController(withIdentifier: "MAPSMainViewController")
        mainNavigationController?.viewControllers = [mainViewController]
        
        return mainNavigationController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.barTintColor = .blue
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
