import UIKit

@available(iOS 11.0, tvOS 11.0, *)
extension UIView {

    // MARK: - Nested Types

    public typealias RoundedCorners = CALayer.RoundedCorners

    // MARK: - Instance Properties

    public var roundedCorners: RoundedCorners {
        get { return layer.roundedCorners }
        set { layer.roundedCorners = newValue }
    }
}
