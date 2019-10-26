#if canImport(QuartzCore) && canImport(CoreGraphics) && !os(watchOS)
import QuartzCore
import CoreGraphics
import Quick
import Nimble

@testable import AurorKit

class CAGradientLayerDirectionExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var layer: CAGradientLayer!

        beforeEach {
            layer = CAGradientLayer()
        }

        describe(".direction") {
            it("should return the correct direction") {
                layer.startPoint = CGPoint.zero
                layer.endPoint = CGPoint(x: 1, y: 0)

                expect(layer.direction).to(equal(.horizontal(inverted: false)))
            }

            it("should return the correct direction") {
                layer.startPoint = CGPoint(x: 1, y: 0)
                layer.endPoint = CGPoint.zero

                expect(layer.direction).to(equal(.horizontal(inverted: true)))
            }

            it("should return the correct direction") {
                layer.startPoint = CGPoint.zero
                layer.endPoint = CGPoint(x: 0, y: 1)

                expect(layer.direction).to(equal(.vertical(inverted: false)))
            }

            it("should return the correct direction") {
                layer.startPoint = CGPoint(x: 0, y: 1)
                layer.endPoint = CGPoint.zero

                expect(layer.direction).to(equal(.vertical(inverted: true)))
            }

            it("should return the correct direction") {
                let startPoint = CGPoint(x: 0, y: 1)
                let endPoint = CGPoint(x: 1, y: 0)

                layer.startPoint = startPoint
                layer.endPoint = endPoint

                expect(layer.direction).to(equal(.custom(startPoint: startPoint, endPoint: endPoint)))
            }

            it("should set direction properly") {
                layer.direction = .horizontal(inverted: false)

                expect(layer.startPoint).to(beCloseTo(CGPoint.zero))
                expect(layer.endPoint).to(beCloseTo(CGPoint(x: 1, y: 0)))
            }

            it("should set direction properly") {
                layer.direction = .horizontal(inverted: true)

                expect(layer.startPoint).to(beCloseTo(CGPoint(x: 1, y: 0)))
                expect(layer.endPoint).to(beCloseTo(CGPoint.zero))
            }

            it("should set direction properly") {
                layer.direction = .vertical(inverted: false)

                expect(layer.startPoint).to(beCloseTo(CGPoint.zero))
                expect(layer.endPoint).to(beCloseTo(CGPoint(x: 0, y: 1)))
            }

            it("should set direction properly") {
                layer.direction = .vertical(inverted: true)

                expect(layer.startPoint).to(beCloseTo(CGPoint(x: 0, y: 1)))
                expect(layer.endPoint).to(beCloseTo(CGPoint.zero))
            }

            it("should set direction properly") {
                let startPoint = CGPoint(x: 0, y: 1)
                let endPoint = CGPoint(x: 1, y: 0)

                layer.direction = .custom(startPoint: startPoint, endPoint: endPoint)

                expect(layer.startPoint).to(beCloseTo(startPoint))
                expect(layer.endPoint).to(beCloseTo(endPoint))
            }
        }
    }
}
#endif
