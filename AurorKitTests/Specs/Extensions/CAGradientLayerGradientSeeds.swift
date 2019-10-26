#if canImport(QuartzCore) && canImport(CoreGraphics) && !os(watchOS)
import QuartzCore
import CoreGraphics

#if canImport(UIKit)
import UIKit

private typealias Color = UIColor
#elseif canImport(AppKit)
import AppKit

private typealias Color = NSColor
#endif

import AurorKit

enum CAGradientLayerGradientSeeds {

    // MARK: - Type Properties

    static let example = CAGradientLayer.Gradient(
        type: .radial,
        direction: .horizontal(inverted: true),
        locations: [0.123, 0.456],
        colors: [
            Color(red: 0.1, green: 0.2, blue: 0.3, alpha: 0.4).cgColor,
            Color(red: 0.5, green: 0.6, blue: 0.7, alpha: 0.8).cgColor
        ]
    )
}
#endif
