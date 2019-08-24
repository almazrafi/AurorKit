import Foundation

extension FloatingPoint {

    // MARK: - Instance Properties

    public var degreesToRadians: Self {
        return self * .pi / 180
    }

    public var radiansToDegrees: Self {
        return self * 180 / .pi
    }
}
