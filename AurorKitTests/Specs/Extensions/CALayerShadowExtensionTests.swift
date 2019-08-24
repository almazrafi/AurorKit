import QuartzCore
import CoreGraphics

import Quick
import Nimble

@testable import AurorKit

class CALayerShadowExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var layer: CALayer!

        beforeEach {
            layer = CALayer()
        }

        describe(".shadow") {
            it("should return a default shadow by default") {
                let expectedShadow = CALayer.Shadow.default

                expect(layer.shadow.offset).to(beCloseTo(expectedShadow.offset))
                expect(layer.shadow.radius).to(beCloseTo(expectedShadow.radius))
                expect(layer.shadow.color).to(beEquivalentTo(expectedShadow.color))
                expect(layer.shadow.opacity).to(beCloseTo(expectedShadow.opacity))
            }

            it("should return the correct shadow") {
                expect(layer.shadow.offset).to(beCloseTo(layer.shadowOffset))
                expect(layer.shadow.radius).to(beCloseTo(layer.shadowRadius))
                expect(layer.shadow.color).to(beEquivalentTo(layer.shadowColor))
                expect(layer.shadow.opacity).to(beCloseTo(layer.shadowOpacity))
            }

            it("should set shadow properly") {
                let expectedShadow = CALayerShadowSeeds.example

                layer.shadow = expectedShadow

                expect(layer.shadowOffset).to(beCloseTo(expectedShadow.offset))
                expect(layer.shadowRadius).to(beCloseTo(expectedShadow.radius))
                expect(layer.shadowColor).to(beEquivalentTo(expectedShadow.color))
                expect(layer.shadowOpacity).to(beCloseTo(expectedShadow.opacity))
            }

            it("should set shadow properly") {
                let expectedShadow = CALayer.Shadow.default

                layer.shadow = expectedShadow

                expect(layer.shadowOffset).to(beCloseTo(expectedShadow.offset))
                expect(layer.shadowRadius).to(beCloseTo(expectedShadow.radius))
                expect(layer.shadowColor).to(beEquivalentTo(expectedShadow.color))
                expect(layer.shadowOpacity).to(beCloseTo(expectedShadow.opacity))
            }
        }
    }
}
