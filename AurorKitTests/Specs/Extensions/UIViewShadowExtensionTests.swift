#if canImport(UIKit) && !os(watchOS)
import UIKit
import Quick
import Nimble

@testable import AurorKit

class UIViewShadowExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var view: UIView!

        beforeEach {
            view = UIView()
        }

        describe(".shadow") {
            it("should return a default shadow by default") {
                let expectedShadow = CALayer.Shadow.default

                expect(view.shadow.offset).to(beCloseTo(expectedShadow.offset))
                expect(view.shadow.radius).to(beCloseTo(expectedShadow.radius))
                expect(view.shadow.color).to(beEquivalentTo(expectedShadow.color))
                expect(view.shadow.opacity).to(beCloseTo(expectedShadow.opacity))
            }

            it("should return the correct shadow") {
                expect(view.shadow.offset).to(beCloseTo(view.layer.shadowOffset))
                expect(view.shadow.radius).to(beCloseTo(view.layer.shadowRadius))
                expect(view.shadow.color).to(beEquivalentTo(view.layer.shadowColor))
                expect(view.shadow.opacity).to(beCloseTo(view.layer.shadowOpacity))
            }

            it("should set shadow properly") {
                let expectedShadow = CALayerShadowSeeds.example

                view.shadow = expectedShadow

                expect(view.layer.shadowOffset).to(beCloseTo(expectedShadow.offset))
                expect(view.layer.shadowRadius).to(beCloseTo(expectedShadow.radius))
                expect(view.layer.shadowColor).to(beEquivalentTo(expectedShadow.color))
                expect(view.layer.shadowOpacity).to(beCloseTo(expectedShadow.opacity))
            }

            it("should set shadow properly") {
                let expectedShadow = CALayer.Shadow.default

                view.shadow = expectedShadow

                expect(view.layer.shadowOffset).to(beCloseTo(expectedShadow.offset))
                expect(view.layer.shadowRadius).to(beCloseTo(expectedShadow.radius))
                expect(view.layer.shadowColor).to(beEquivalentTo(expectedShadow.color))
                expect(view.layer.shadowOpacity).to(beCloseTo(expectedShadow.opacity))
            }
        }
    }
}
#endif
