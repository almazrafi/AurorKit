#if canImport(UIKit)
    import UIKit

    private typealias Color = UIColor
#elseif canImport(AppKit)
    import AppKit

    private typealias Color = NSColor
#endif

extension CALayer {

    // MARK: - Nested Types

    public struct Border: Equatable {

        // MARK: - Type Properties

        public static let `default` = Border()

        // MARK: - Instance Properties

        public let width: CGFloat
        public let color: CGColor?

        // MARK: - Initializers

        public init(width: CGFloat = 0.0, color: CGColor?) {
            self.width = width
            self.color = color
        }

        public init(width: CGFloat = 0.0) {
            self.width = width
            self.color = Color.black.cgColor
        }
    }

    // MARK: - Instance Properties

    public var border: Border {
        get {
            return Border(
                width: borderWidth,
                color: borderColor
            )
        }

        set {
            borderWidth = newValue.width
            borderColor = newValue.color
        }
    }
}
