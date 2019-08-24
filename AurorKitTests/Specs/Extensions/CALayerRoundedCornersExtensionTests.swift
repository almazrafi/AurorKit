import QuartzCore
import CoreGraphics

import Quick
import Nimble

@testable import AurorKit

@available(iOS 11.0, macOS 10.13, tvOS 11.0, *)
class CALayerRoundedCornersExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var layer: CALayer!

        beforeEach {
            layer = CALayer()
        }

        describe(".roundedCorners") {
            it("should return a default rounded corners by default") {
                let expectedRoundedCorners = CALayer.RoundedCorners.default

                expect(layer.roundedCorners.radius).to(beCloseTo(expectedRoundedCorners.radius))
                expect(layer.roundedCorners.mask).to(equal(expectedRoundedCorners.mask))
            }

            it("should return the correct rounded corners") {
                expect(layer.roundedCorners.radius).to(beCloseTo(layer.cornerRadius))
                expect(layer.roundedCorners.mask).to(equal(layer.maskedCorners))
            }

            it("should set rounded corners properly") {
                let expectedRoundedCorners = CALayerRoundedCornersSeeds.example

                layer.roundedCorners = expectedRoundedCorners

                expect(layer.cornerRadius).to(beCloseTo(expectedRoundedCorners.radius))
                expect(layer.maskedCorners).to(equal(expectedRoundedCorners.mask))
            }

            it("should set rounded corners properly") {
                let expectedRoundedCorners = CALayer.RoundedCorners.default

                layer.roundedCorners = expectedRoundedCorners

                expect(layer.cornerRadius).to(beCloseTo(expectedRoundedCorners.radius))
                expect(layer.maskedCorners).to(equal(expectedRoundedCorners.mask))
            }
        }
    }
}
