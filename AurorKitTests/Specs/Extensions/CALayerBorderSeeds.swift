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

enum CALayerBorderSeeds {

    // MARK: - Type Properties

    static let example = CALayer.Border(
        width: 1.23,
        color: Color(red: 0.12, green: 0.34, blue: 0.56, alpha: 0.78).cgColor
    )
}
#endif
