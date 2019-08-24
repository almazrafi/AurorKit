import QuartzCore
import CoreGraphics

import Quick
import Nimble

@testable import AurorKit

class CAGradientLayerGradientExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".init(gradient:)") {
            it("should initialize properly") {
                let expectedGradient = CAGradientLayerGradientSeeds.example

                let layer = CAGradientLayer(gradient: expectedGradient)

                expect(layer.type).to(equal(expectedGradient.type))
                expect(layer.locations?.map { $0.doubleValue }).to(beEquivalentTo(expectedGradient.locations))
                expect(layer.direction).to(equal(expectedGradient.direction))
                expect(layer.colors?.map { ($0 as! CGColor) }).to(beEquivalentTo(expectedGradient.colors))
            }
        }

        context("when it is initialized") {
            var layer: CAGradientLayer!

            beforeEach {
                layer = CAGradientLayer()
            }

            describe(".gradient") {
                it("should return a default gradient by default") {
                    let expectedGradient = CAGradientLayer.Gradient.default

                    expect(layer.gradient.type).to(equal(expectedGradient.type))
                    expect(layer.locations?.map { $0.doubleValue }).to(beEquivalentTo(expectedGradient.locations))
                    expect(layer.gradient.direction).to(equal(expectedGradient.direction))
                    expect(layer.gradient.colors).to(beEquivalentTo(expectedGradient.colors))
                }

                it("should return the correct gradient") {
                    expect(layer.gradient.type).to(equal(layer.type))
                    expect(layer.gradient.locations).to(beEquivalentTo(layer.locations?.map { $0.doubleValue }))
                    expect(layer.gradient.direction).to(equal(layer.direction))
                    expect(layer.gradient.colors).to(beEquivalentTo(layer.colors?.map { ($0 as! CGColor) }))
                }

                it("should set gradient properly") {
                    let expectedGradient = CAGradientLayerGradientSeeds.example

                    layer.gradient = expectedGradient

                    expect(layer.type).to(equal(expectedGradient.type))
                    expect(layer.locations?.map { $0.doubleValue }).to(beEquivalentTo(expectedGradient.locations))
                    expect(layer.direction).to(equal(expectedGradient.direction))
                    expect(layer.colors?.map { ($0 as! CGColor) }).to(beEquivalentTo(expectedGradient.colors))
                }

                it("should set gradient properly") {
                    let expectedGradient = CAGradientLayer.Gradient.default

                    layer.gradient = expectedGradient

                    expect(layer.type).to(equal(expectedGradient.type))
                    expect(layer.locations?.map { $0.doubleValue }).to(beEquivalentTo(expectedGradient.locations))
                    expect(layer.direction).to(equal(expectedGradient.direction))
                    expect(layer.colors?.map { ($0 as! CGColor) }).to(beEquivalentTo(expectedGradient.colors))
                }
            }
        }
    }
}
