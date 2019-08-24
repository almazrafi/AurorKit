import Foundation
import CoreGraphics

extension CGRect {

    // MARK: - Instance Properties

    public var adjusted: CGRect {
        return CGRect(
            x: minX.rounded(.down),
            y: minY.rounded(.down),
            width: abs(width.rounded(.awayFromZero)),
            height: abs(height.rounded(.awayFromZero))
        )
    }

    // MARK: - Initializers

    public init(x: CGFloat, y: CGFloat, size: CGSize) {
        self.init(x: x, y: y, width: size.width, height: size.height)
    }

    public init(x: Double, y: Double, size: CGSize) {
        self.init(x: CGFloat(x), y: CGFloat(y), width: size.width, height: size.height)
    }

    public init(x: Int, y: Int, size: CGSize) {
        self.init(x: CGFloat(x), y: CGFloat(y), width: size.width, height: size.height)
    }

    public init(origin: CGPoint, width: CGFloat, height: CGFloat) {
        self.init(x: origin.x, y: origin.y, width: width, height: height)
    }

    public init(origin: CGPoint, width: Double, height: Double) {
        self.init(x: origin.x, y: origin.y, width: CGFloat(width), height: CGFloat(height))
    }

    public init(origin: CGPoint, width: Int, height: Int) {
        self.init(x: origin.x, y: origin.y, width: CGFloat(width), height: CGFloat(height))
    }
}
