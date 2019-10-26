#if canImport(UIKit) && !os(watchOS)
import UIKit

extension UIStackView {

    // MARK: - Initializers

    public convenience init(axis: NSLayoutConstraint.Axis, frame: CGRect = .zero) {
        self.init(frame: frame)

        self.axis = axis
    }

    // MARK: - Instance Methods

    public func insertArrangedSubview(_ view: UIView, after arrangedSubview: UIView) {
        guard let arrangedSubviewIndex = arrangedSubviews.firstIndex(of: arrangedSubview) else {
            return addArrangedSubview(view)
        }

        insertArrangedSubview(view, at: arrangedSubviewIndex + 1)
    }

    public func insertArrangedSubview(_ view: UIView, before arrangedSubview: UIView) {
        guard let arrangedSubviewIndex = arrangedSubviews.firstIndex(of: arrangedSubview) else {
            return addArrangedSubview(view)
        }

        insertArrangedSubview(view, at: arrangedSubviewIndex)
    }
}
#endif
