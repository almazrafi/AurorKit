import Foundation
import CoreGraphics

import Quick
import Nimble

@testable import AurorKit

class CGSizeExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".init(equilateral:)") {
            it("should initialize properly") {
                let size = CGSize(equilateral: CGFloat(1.23))

                expect(size.width).to(beCloseTo(1.23))
                expect(size.height).to(beCloseTo(1.23))
            }

            it("should initialize properly") {
                let size = CGSize(equilateral: Double(1.23))

                expect(size.width).to(beCloseTo(1.23))
                expect(size.height).to(beCloseTo(1.23))
            }

            it("should initialize properly") {
                let size = CGSize(equilateral: Int(123))

                expect(size.width).to(beCloseTo(123.0))
                expect(size.height).to(beCloseTo(123.0))
            }
        }

        describe(".adjusted") {
            it("should return a properly adjusted size") {
                let size = CGSize(width: 1.4, height: 2.5).adjusted

                expect(size).to(beCloseTo(CGSize(width: 2.0, height: 3.0)))
            }

            it("should return a properly adjusted size") {
                let size = CGSize(width: 1.5, height: 2.6).adjusted

                expect(size).to(beCloseTo(CGSize(width: 2.0, height: 3.0)))
            }

            it("should return a properly adjusted size") {
                let size = CGSize(width: -1.4, height: -2.5).adjusted

                expect(size).to(beCloseTo(CGSize(width: -2.0, height: -3.0)))
            }

            it("should return a properly adjusted size") {
                let size = CGSize(width: -1.5, height: -2.6).adjusted

                expect(size).to(beCloseTo(CGSize(width: -2.0, height: -3.0)))
            }
        }
    }
}
