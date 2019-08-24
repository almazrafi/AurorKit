import Foundation
import CoreGraphics

import Quick
import Nimble

@testable import AurorKit

class CGRectExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".init(x:y:size:)") {
            it("should initialize properly") {
                let rect = CGRect(
                    x: CGFloat(1.2),
                    y: CGFloat(3.4),
                    size: CGSize(width: 5.6, height: 7.8)
                )

                expect(rect.origin.x).to(beCloseTo(1.2))
                expect(rect.origin.y).to(beCloseTo(3.4))
                expect(rect.size.width).to(beCloseTo(5.6))
                expect(rect.size.height).to(beCloseTo(7.8))
            }

            it("should initialize properly") {
                let rect = CGRect(
                    x: Double(1.2),
                    y: Double(3.4),
                    size: CGSize(width: 5.6, height: 7.8)
                )

                expect(rect.origin.x).to(beCloseTo(1.2))
                expect(rect.origin.y).to(beCloseTo(3.4))
                expect(rect.size.width).to(beCloseTo(5.6))
                expect(rect.size.height).to(beCloseTo(7.8))
            }

            it("should initialize properly") {
                let rect = CGRect(
                    x: Int(12),
                    y: Int(34),
                    size: CGSize(width: 56, height: 78)
                )

                expect(rect.origin.x).to(beCloseTo(12.0))
                expect(rect.origin.y).to(beCloseTo(34.0))
                expect(rect.size.width).to(beCloseTo(56.0))
                expect(rect.size.height).to(beCloseTo(78.0))
            }
        }

        describe(".init(origin:width:height:)") {
            it("should initialize properly") {
                let rect = CGRect(
                    origin: CGPoint(x: 1.2, y: 3.4),
                    width: CGFloat(5.6),
                    height: CGFloat(7.8)
                )

                expect(rect.origin.x).to(beCloseTo(1.2))
                expect(rect.origin.y).to(beCloseTo(3.4))
                expect(rect.size.width).to(beCloseTo(5.6))
                expect(rect.size.height).to(beCloseTo(7.8))
            }

            it("should initialize properly") {
                let rect = CGRect(
                    origin: CGPoint(x: 1.2, y: 3.4),
                    width: Double(5.6),
                    height: Double(7.8)
                )

                expect(rect.origin.x).to(beCloseTo(1.2))
                expect(rect.origin.y).to(beCloseTo(3.4))
                expect(rect.size.width).to(beCloseTo(5.6))
                expect(rect.size.height).to(beCloseTo(7.8))
            }

            it("should initialize properly") {
                let rect = CGRect(
                    origin: CGPoint(x: 12, y: 34),
                    width: Int(56),
                    height: Int(78)
                )

                expect(rect.origin.x).to(beCloseTo(12.0))
                expect(rect.origin.y).to(beCloseTo(34.0))
                expect(rect.size.width).to(beCloseTo(56.0))
                expect(rect.size.height).to(beCloseTo(78.0))
            }
        }

        describe(".adjusted") {
            it("should return a properly adjusted rect") {
                let rect = CGRect(x: 1.4, y: 2.5, width: 3.4, height: 4.5).adjusted

                expect(rect).to(beCloseTo(CGRect(x: 1.0, y: 2.0, width: 4.0, height: 5.0)))
            }

            it("should return a properly adjusted rect") {
                let rect = CGRect(x: 1.5, y: 2.6, width: 3.5, height: 4.6).adjusted

                expect(rect).to(beCloseTo(CGRect(x: 1.0, y: 2.0, width: 4.0, height: 5.0)))
            }

            it("should return a properly adjusted rect") {
                let rect = CGRect(x: -1.4, y: -2.5, width: 3.4, height: 4.5).adjusted

                expect(rect).to(beCloseTo(CGRect(x: -2.0, y: -3.0, width: 4.0, height: 5.0)))
            }

            it("should return a properly adjusted rect") {
                let rect = CGRect(x: -1.5, y: -2.6, width: 3.5, height: 4.6).adjusted

                expect(rect).to(beCloseTo(CGRect(x: -2.0, y: -3.0, width: 4.0, height: 5.0)))
            }

            it("should return a properly adjusted rect") {
                let rect = CGRect(x: -1.4, y: -2.5, width: -3.4, height: -4.5).adjusted

                expect(rect).to(beCloseTo(CGRect(x: -5.0, y: -7.0, width: 4.0, height: 5.0)))
            }

            it("should return a properly adjusted rect") {
                let rect = CGRect(x: -1.5, y: -2.6, width: -3.5, height: -4.6).adjusted

                expect(rect).to(beCloseTo(CGRect(x: -5.0, y: -8.0, width: 4.0, height: 5.0)))
            }
        }
    }
}
