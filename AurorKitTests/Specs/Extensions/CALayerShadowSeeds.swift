#if canImport(UIKit)
    import UIKit

    private typealias Color = UIColor
#elseif canImport(AppKit)
    import AppKit

    private typealias Color = NSColor
#endif

import AurorKit

enum CALayerShadowSeeds {

    // MARK: - Type Properties

    static let example = CALayer.Shadow(
        offset: CGSize(width: 1.23, height: 4.56),
        radius: 3.21,
        color: Color(red: 0.12, green: 0.34, blue: 0.56, alpha: 0.78).cgColor,
        opacity: 0.789
    )
}
