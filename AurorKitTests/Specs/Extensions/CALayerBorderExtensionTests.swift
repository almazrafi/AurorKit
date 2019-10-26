#if canImport(QuartzCore) && canImport(CoreGraphics) && !os(watchOS)
import QuartzCore
import CoreGraphics
import Quick
import Nimble

@testable import AurorKit

class CALayerBorderExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var layer: CALayer!

        beforeEach {
            layer = CALayer()
        }

        describe(".border") {
            it("should return a default border by default") {
                let expectedBorder = CALayer.Border.default

                expect(layer.border.width).to(beCloseTo(expectedBorder.width))
                expect(layer.border.color).to(beEquivalentTo(expectedBorder.color))
            }

            it("should return the correct border") {
                expect(layer.border.width).to(beCloseTo(layer.borderWidth))
                expect(layer.border.color).to(beEquivalentTo(layer.borderColor))
            }

            it("should set border properly") {
                let expectedBorder = CALayerBorderSeeds.example

                layer.border = expectedBorder

                expect(layer.borderWidth).to(beCloseTo(expectedBorder.width))
                expect(layer.borderColor).to(beEquivalentTo(expectedBorder.color))
            }

            it("should set border properly") {
                let expectedBorder = CALayer.Border.default

                layer.border = expectedBorder

                expect(layer.borderWidth).to(beCloseTo(expectedBorder.width))
                expect(layer.borderColor).to(beEquivalentTo(expectedBorder.color))
            }
        }
    }
}
#endif
