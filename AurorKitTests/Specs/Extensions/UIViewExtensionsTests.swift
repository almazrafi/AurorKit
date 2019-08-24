import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIViewExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".horizontal") {
            it("should return the sum of the left and right insets") {
                let edgeInsets = UIEdgeInsets(top: 0.0, left: 1.23, bottom: 0.0, right: 45.6)

                expect(edgeInsets.horizontal).to(beCloseTo(46.83))
            }
        }
    }
}
