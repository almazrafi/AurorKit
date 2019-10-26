#if canImport(UIKit) && !os(watchOS)
import UIKit

extension UIWindow {

    // MARK: - Instance Methods

    public var topViewController: UIViewController? {
        var topViewController = rootViewController
        var nextViewController = topViewController

        while nextViewController != nil {
            topViewController = nextViewController

            switch topViewController {
            case let navigationController as UINavigationController:
                if let visibleViewController = navigationController.visibleViewController {
                    nextViewController = visibleViewController
                } else {
                    nextViewController = navigationController.topViewController
                }

            case let tabBarController as UITabBarController:
                nextViewController = tabBarController.selectedViewController

            default:
                if let presentedViewController = topViewController?.presentedViewController {
                    nextViewController = presentedViewController
                } else {
                    nextViewController = topViewController?.children.first
                }
            }
        }

        return topViewController
    }
}
#endif
