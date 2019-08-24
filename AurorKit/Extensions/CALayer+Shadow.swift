#if canImport(UIKit)
    import UIKit

    private typealias Color = UIColor
#elseif canImport(AppKit)
    import AppKit

    private typealias Color = NSColor
#endif

extension CALayer {

    // MARK: - Nested Types

    public struct Shadow: Equatable {

        // MARK: - Type Properties

        public static let `default` = Shadow()

        // MARK: - Instance Properties

        public let offset: CGSize
        public let radius: CGFloat
        public let color: CGColor?
        public let opacity: Float

        // MARK: - Initializers

        public init(
            offset: CGSize = CGSize(width: 0, height: -3),
            radius: CGFloat = 3.0,
            color: CGColor?,
            opacity: Float = 0.0
        ) {
            self.offset = offset
            self.radius = radius
            self.color = color
            self.opacity = opacity
        }

        public init(
            offset: CGSize = CGSize(width: 0, height: -3),
            radius: CGFloat = 3.0,
            opacity: Float = 0.0
        ) {
            self.offset = offset
            self.radius = radius
            self.color = Color.black.cgColor
            self.opacity = opacity
        }
    }

    // MARK: - Instance Properties

    public var shadow: Shadow {
        get {
            return Shadow(
                offset: shadowOffset,
                radius: shadowRadius,
                color: shadowColor,
                opacity: shadowOpacity
            )
        }

        set {
            shadowOffset = newValue.offset
            shadowRadius = newValue.radius
            shadowColor = newValue.color
            shadowOpacity = newValue.opacity
        }
    }
}
