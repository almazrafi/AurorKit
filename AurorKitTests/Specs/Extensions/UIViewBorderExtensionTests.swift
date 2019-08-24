import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIViewBorderExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var view: UIView!

        beforeEach {
            view = UIView()
        }

        describe(".border") {
            it("should return a default border by default") {
                let expectedBorder = UIView.Border.default

                expect(view.border.width).to(beCloseTo(expectedBorder.width))
                expect(view.border.color).to(beEquivalentTo(expectedBorder.color))
            }

            it("should return the correct border") {
                expect(view.border.width).to(beCloseTo(view.layer.borderWidth))
                expect(view.border.color).to(beEquivalentTo(view.layer.borderColor))
            }

            it("should set border properly") {
                let expectedBorder = CALayerBorderSeeds.example

                view.border = expectedBorder

                expect(view.layer.borderWidth).to(beCloseTo(expectedBorder.width))
                expect(view.layer.borderColor).to(beEquivalentTo(expectedBorder.color))
            }

            it("should set border properly") {
                let expectedBorder = UIView.Border.default

                view.border = expectedBorder

                expect(view.layer.borderWidth).to(beCloseTo(expectedBorder.width))
                expect(view.layer.borderColor).to(beEquivalentTo(expectedBorder.color))
            }
        }
    }
}
