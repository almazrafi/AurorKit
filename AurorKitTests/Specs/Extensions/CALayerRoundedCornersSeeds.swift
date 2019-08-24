import QuartzCore
import CoreGraphics
import AurorKit

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
enum CALayerRoundedCornersSeeds {

    // MARK: - Type Properties

    static let example = CALayer.RoundedCorners(
        radius: 1.23,
        mask: [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
    )
}
