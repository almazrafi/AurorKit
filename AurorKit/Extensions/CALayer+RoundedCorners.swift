import QuartzCore
import CoreGraphics

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension CALayer {

    // MARK: - Nested Types

    public struct RoundedCorners {

        // MARK: - Nested Types

        public static let `default` = RoundedCorners()

        // MARK: - Instance Properties

        public let radius: CGFloat
        public let mask: CACornerMask

        // MARK: - Initializers

        public init(radius: CGFloat = 0.0, mask: CACornerMask = .allCorners) {
            self.radius = radius
            self.mask = mask
        }
    }

    // MARK: - Instance Properties

    public var roundedCorners: RoundedCorners {
        get {
            return RoundedCorners(
                radius: cornerRadius,
                mask: maskedCorners
            )
        }

        set {
            cornerRadius = newValue.radius
            maskedCorners = newValue.mask
        }
    }
}
