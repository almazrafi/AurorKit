import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIScreenExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".pixelSize") {
            it("should return the size of one screen pixel") {
                expect(UIScreen.main.pixelSize).to(beCloseTo(1.0 / UIScreen.main.scale))
            }
        }
    }
}
