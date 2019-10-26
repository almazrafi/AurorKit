#if canImport(UIKit) && !os(watchOS)
import UIKit

extension UINavigationController {

    // MARK: - Instance Methods

    public func pushViewControllers(_ viewControllers: [UIViewController], animated: Bool = true) {
        setViewControllers(
            self.viewControllers.appending(contentsOf: viewControllers),
            animated: animated
        )
    }
}
#endif
