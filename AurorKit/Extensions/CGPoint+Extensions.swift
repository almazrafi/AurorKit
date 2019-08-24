import Foundation
import CoreGraphics

extension CGPoint {

    // MARK: - Instance Properties

    public var adjusted: CGPoint {
        return CGPoint(x: x.rounded(.down), y: y.rounded(.down))
    }
}
