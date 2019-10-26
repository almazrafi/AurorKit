#if canImport(CoreGraphics)
import CoreGraphics

extension CGSize {

    // MARK: - Instance Properties

    public var adjusted: CGSize {
        return CGSize(width: width.rounded(.awayFromZero), height: height.rounded(.awayFromZero))
    }

    // MARK: - Initializers

    public init(equilateral side: CGFloat) {
        self.init(width: side, height: side)
    }

    public init(equilateral side: Double) {
        self.init(width: side, height: side)
    }

    public init(equilateral side: Int) {
        self.init(width: side, height: side)
    }
}
#endif
