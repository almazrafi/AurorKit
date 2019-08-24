import UIKit

import Quick
import Nimble

@testable import AurorKit

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
class UIViewRoundedCornersExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var view: UIView!

        beforeEach {
            view = UIView()
        }

        describe(".roundedCorners") {
            it("should return a default rounded corners by default") {
                let expectedRoundedCorners = UIView.RoundedCorners.default

                expect(view.roundedCorners.radius).to(beCloseTo(expectedRoundedCorners.radius))
                expect(view.roundedCorners.mask).to(equal(expectedRoundedCorners.mask))
            }

            it("should return the correct rounded corners") {
                expect(view.roundedCorners.radius).to(beCloseTo(view.layer.cornerRadius))
                expect(view.roundedCorners.mask).to(equal(view.layer.maskedCorners))
            }

            it("should set rounded corners properly") {
                let expectedRoundedCorners = CALayerRoundedCornersSeeds.example

                view.roundedCorners = expectedRoundedCorners

                expect(view.layer.cornerRadius).to(beCloseTo(expectedRoundedCorners.radius))
                expect(view.layer.maskedCorners).to(equal(expectedRoundedCorners.mask))
            }

            it("should set rounded corners properly") {
                let expectedRoundedCorners = UIView.RoundedCorners.default

                view.roundedCorners = expectedRoundedCorners

                expect(view.layer.cornerRadius).to(beCloseTo(expectedRoundedCorners.radius))
                expect(view.layer.maskedCorners).to(equal(expectedRoundedCorners.mask))
            }
        }
    }
}
