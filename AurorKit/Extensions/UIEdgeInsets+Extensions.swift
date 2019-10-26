#if canImport(UIKit)
import UIKit

extension UIEdgeInsets {

    // MARK: - Instance Properties

    public var horizontal: CGFloat {
        return left + right
    }

    public var vertical: CGFloat {
        return top + bottom
    }

    // MARK: - Initializers

    public init(equilateral side: CGFloat) {
        self.init(top: side, left: side, bottom: side, right: side)
    }
}
#endif
