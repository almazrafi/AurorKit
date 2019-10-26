#if canImport(UIKit)
import UIKit

extension UIImage {

    // MARK: - Instance Properties

    public var alignmentRect: CGRect {
        return CGRect(
            x: alignmentRectInsets.left,
            y: alignmentRectInsets.top,
            width: size.width - alignmentRectInsets.left - alignmentRectInsets.right,
            height: size.height - alignmentRectInsets.top - alignmentRectInsets.bottom
        )
    }

    // MARK: - Instance Methods

    public func scaled(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        draw(in: CGRect(x: 0.0, y: 0.0, size: size))

        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsEndImageContext()

        return scaledImage
    }

    public func scaledToWidth(_ width: CGFloat) -> UIImage? {
        guard size.width >= 1.0 else {
            return scaled(to: CGSize(width: width, height: width))
        }

        return scaled(to: CGSize(width: width, height: size.height * width / size.width))
    }

    public func scaledToHeight(_ height: CGFloat) -> UIImage? {
        guard size.height >= 1.0 else {
            return scaled(to: CGSize(width: height, height: height))
        }

        return scaled(to: CGSize(width: size.width * height / size.height, height: height))
    }
}
#endif
