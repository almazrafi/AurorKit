import QuartzCore
import CoreGraphics

extension CAGradientLayer {

    // MARK: - Nested Types

    public struct Gradient: Equatable {

        // MARK: - Type Properties

        public static let `default` = Gradient()

        // MARK: - Instance Properties

        public let type: CAGradientLayerType
        public let direction: Direction
        public let locations: [Double]?
        public let colors: [CGColor]?

        // MARK: - Initializers

        public init(
            type: CAGradientLayerType = .axial,
            direction: Direction = .vertical(inverted: false),
            locations: [Double]? = nil,
            colors: [CGColor]? = nil
        ) {
            self.type = type
            self.direction = direction
            self.locations = locations
            self.colors = colors
        }
    }

    // MARK: - Instance Properties

    public var gradient: Gradient {
        get {
            return Gradient(
                type: type,
                direction: direction,
                locations: locations?.map { $0.doubleValue },
                colors: colors?.map { $0 as! CGColor }
            )
        }

        set {
            type = newValue.type
            direction = newValue.direction
            locations = newValue.locations?.compactMap(NSNumber.init(value:))
            colors = newValue.colors
        }
    }

    // MARK: - Initializers

    public convenience init(gradient: Gradient) {
        self.init()

        self.gradient = gradient
    }
}
