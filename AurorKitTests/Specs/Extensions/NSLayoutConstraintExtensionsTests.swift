#if canImport(UIKit) && !os(watchOS) && !os(macOS)
import UIKit
import Quick
import Nimble

@testable import AurorKit

class NSLayoutConstraintExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var view: UIView!

        beforeEach {
            view = UIView()
        }

        describe(".preciseConstant") {
            var constraint: NSLayoutConstraint!

            beforeEach {
                constraint = view.widthAnchor.constraint(equalToConstant: 123.0)
            }

            it("should return an properly constant") {
                expect(constraint.preciseConstant).to(equal(Int(123.0 * UIScreen.main.scale)))
            }

            it("should set an properly constant") {
                constraint.preciseConstant = 1

                expect(constraint.constant).to(equal(1.0 / UIScreen.main.scale))
            }
        }
    }
}
#endif
