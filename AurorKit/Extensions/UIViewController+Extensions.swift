#if canImport(UIKit) && !os(watchOS)
import UIKit

extension UIViewController {

    // MARK: - Instance Properties

    public var isVisible: Bool {
        return viewIfLoaded?.window?.isHidden == false
    }
}
#endif
