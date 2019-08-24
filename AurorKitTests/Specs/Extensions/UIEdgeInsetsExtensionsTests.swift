import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIEdgeInsetsExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".init(equilateral:)") {
            it("should initialize properly") {
                let edgeInsets = UIEdgeInsets(equilateral: 1.23)

                expect(edgeInsets.top).to(beCloseTo(1.23))
                expect(edgeInsets.left).to(beCloseTo(1.23))
                expect(edgeInsets.bottom).to(beCloseTo(1.23))
                expect(edgeInsets.right).to(beCloseTo(1.23))
            }
        }

        describe(".horizontal") {
            it("should return the sum of the left and right insets") {
                let edgeInsets = UIEdgeInsets(top: 0.0, left: 1.23, bottom: 0.0, right: 45.6)

                expect(edgeInsets.horizontal).to(beCloseTo(46.83))
            }
        }

        describe(".vertical") {
            it("should return the sum of the top and bottom insets") {
                let edgeInsets = UIEdgeInsets(top: 1.23, left: 0.0, bottom: 45.6, right: 0.0)

                expect(edgeInsets.vertical).to(beCloseTo(46.83))
            }
        }
    }
}
