#if canImport(CoreGraphics)
import CoreGraphics
import Quick
import Nimble

@testable import AurorKit

class CGPointExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".adjusted") {
            it("should return a properly adjusted point") {
                let point = CGPoint(x: 1.4, y: 2.5).adjusted

                expect(point).to(beCloseTo(CGPoint(x: 1.0, y: 2.0)))
            }

            it("should return a properly adjusted point") {
                let point = CGPoint(x: 1.5, y: 2.6).adjusted

                expect(point).to(beCloseTo(CGPoint(x: 1.0, y: 2.0)))
            }

            it("should return a properly adjusted point") {
                let point = CGPoint(x: -1.4, y: -2.5).adjusted

                expect(point).to(beCloseTo(CGPoint(x: -2.0, y: -3.0)))
            }

            it("should return a properly adjusted point") {
                let point = CGPoint(x: -1.5, y: -2.6).adjusted

                expect(point).to(beCloseTo(CGPoint(x: -2.0, y: -3.0)))
            }
        }
    }
}
#endif
