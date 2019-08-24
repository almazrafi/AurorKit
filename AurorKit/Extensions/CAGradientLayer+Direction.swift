import QuartzCore

extension CAGradientLayer {

    // MARK: - Nested Types

    public enum Direction: Equatable {

        // MARK: - Enumeration Cases

        case custom(startPoint: CGPoint, endPoint: CGPoint)
        case horizontal(inverted: Bool)
        case vertical(inverted: Bool)
    }

    // MARK: - Instance Properties

    public var direction: Direction {
        get {
            switch (startPoint.x, startPoint.y, endPoint.x, endPoint.y) {
            case (0.0, _, 1.0, _) where startPoint.y == endPoint.y:
                return .horizontal(inverted: false)

            case (1.0, _, 0.0, _) where startPoint.y == endPoint.y:
                return .horizontal(inverted: true)

            case (_, 0.0, _, 1.0) where startPoint.x == endPoint.x:
                return .vertical(inverted: false)

            case (_, 1.0, _, 0.0) where startPoint.x == endPoint.x:
                return .vertical(inverted: true)

            default:
                return .custom(startPoint: startPoint, endPoint: endPoint)
            }
        }

        set {
            switch newValue {
            case let .custom(startPoint, endPoint):
                self.startPoint = startPoint
                self.endPoint = endPoint

            case .horizontal(inverted: false):
                startPoint = CGPoint.zero
                endPoint = CGPoint(x: 1, y: 0)

            case .horizontal(inverted: true):
                startPoint = CGPoint(x: 1, y: 0)
                endPoint = CGPoint.zero

            case .vertical(inverted: false):
                startPoint = CGPoint.zero
                endPoint = CGPoint(x: 0, y: 1)

            case .vertical(inverted: true):
                startPoint = CGPoint(x: 0, y: 1)
                endPoint = CGPoint.zero
            }
        }
    }
}
