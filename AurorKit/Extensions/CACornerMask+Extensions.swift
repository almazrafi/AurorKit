#if canImport(QuartzCore) && !os(watchOS)
import QuartzCore

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
extension CACornerMask {

    // MARK: - Type Properties

    public static let allCorners: CACornerMask = [
        .layerMinXMinYCorner,
        .layerMaxXMinYCorner,
        .layerMinXMaxYCorner,
        .layerMaxXMaxYCorner
    ]
}
#endif
