import Foundation

import Quick
import Nimble

@testable import AurorKit

class FloatingPointExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".degreesToRadians") {
            it("should return the angle in radians") {
                let degrees = 0.0

                expect(degrees.degreesToRadians).to(equal(0.0))
            }

            it("should return the angle in radians") {
                let degrees = 90.0

                expect(degrees.degreesToRadians).to(equal(Double.pi / 2.0))
            }

            it("should return the angle in radians") {
                let degrees = 180.0

                expect(degrees.degreesToRadians).to(equal(Double.pi))
            }

            it("should return the angle in radians") {
                let degrees = 360.0

                expect(degrees.degreesToRadians).to(equal(Double.pi * 2))
            }
        }

        describe(".radiansToDegrees") {
            it("should return the angle in degrees") {
                let radians = 0.0

                expect(radians.radiansToDegrees).to(equal(0.0))
            }

            it("should return the angle in degrees") {
                let radians = Double.pi / 2.0

                expect(radians.radiansToDegrees).to(equal(90.0))
            }

            it("should return the angle in degrees") {
                let radians = Double.pi

                expect(radians.radiansToDegrees).to(equal(180.0))
            }

            it("should return the angle in degrees") {
                let radians = Double.pi * 2.0

                expect(radians.radiansToDegrees).to(equal(360.0))
            }
        }
    }
}
