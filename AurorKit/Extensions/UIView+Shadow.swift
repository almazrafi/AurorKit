#if canImport(UIKit) && !os(watchOS)
import UIKit

extension UIView {

    // MARK: - Nested Types

    public typealias Shadow = CALayer.Shadow

    // MARK: - Instance Properties

    public var shadow: Shadow {
        get { return layer.shadow }
        set { layer.shadow = newValue }
    }
}
#endif
