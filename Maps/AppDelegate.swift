import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    /**
     Saved shortcutItem used as a result of an app launch, used later when app is activated.
     */
    var launchOptionsShortcutItem: UIApplicationShortcutItem?
    
    lazy var rootViewController: MAPSMainNavigationController? = {
        return MAPSMainNavigationController.makeMainNavigationController()
    }()
    
    lazy var mainViewController: MAPSMainViewController? = { [unowned self] in
        var mainViewController: MAPSMainViewController?
        guard let rootViewController = self.rootViewController else {
            assertionFailure("Failed to set up rootViewController.")
            return mainViewController
        }
        return rootViewController.viewControllers.first as? MAPSMainViewController
    }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        MAPSEnvironmentManager.configure()

        

        
        configureRootViewController()
        
        // Return boolean for didFinishLaunchingWithOptions.  Override point for customization
        // after application launch.
        var shouldPerformAdditionalDelegateHandling = true
        
        return shouldPerformAdditionalDelegateHandling
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Call handleShortcutItem if app did finish launching via the launchOptions shortcutItem.
        guard let shortcut = launchOptionsShortcutItem else { return }
        
        // Reset the shortcutItem for next app launch.
        launchOptionsShortcutItem = nil
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Update dynamic shortcuts to the latest state.
    }
    
    
    func application(_ application: UIApplication,
                     performActionFor shortcutItem: UIApplicationShortcutItem,
                     completionHandler: @escaping (Bool) -> Void) {
        
    }
}

private extension AppDelegate {
    
    /**
     Instantiate the rootRiewController and the mainViewController.
     */
    private func configureRootViewController() {
        guard let rootViewController = rootViewController,
            let mainViewController = mainViewController else {
                assertionFailure("Failed to set up rootViewController and mainViewController.")
                return
        }

        window = UIWindow()
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        window?.backgroundColor = .gray
    }
    
}
