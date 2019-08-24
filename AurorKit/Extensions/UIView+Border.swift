import UIKit

extension UIView {

    // MARK: - Nested Types

    public typealias Border = CALayer.Border

    // MARK: - Instance Properties

    public var border: Border {
        get { return layer.border }
        set { layer.border = newValue }
    }
}
