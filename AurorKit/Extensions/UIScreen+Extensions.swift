#if canImport(UIKit) && !os(watchOS)
import UIKit

extension UIScreen {

    // MARK: - Instance Properties

    public var pixelSize: CGFloat {
        return 1.0 / scale
    }
}
#endif
