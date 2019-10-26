#if canImport(UIKit) && !os(watchOS)
import UIKit
import Quick
import Nimble

@testable import AurorKit

class UIViewControllerExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var window: UIWindow!
        var viewController: UIViewController!

        beforeEach {
            window = UIWindow(frame: UIScreen.main.bounds)
            viewController = UIViewController()
        }

        describe(".hasWindow") {
            context("when window has no root view controller") {
                it("should return false") {
                    expect(viewController.isVisible).to(beFalse())
                }
            }

            context("when window has root view controller") {
                beforeEach {
                    window.rootViewController = viewController
                }

                it("should return false when window is hidden") {
                    expect(viewController.isVisible).toEventually(beFalse())
                }

                context("when window is visible") {
                    beforeEach {
                        window.isHidden = false
                    }

                    it("should return true") {
                        expect(viewController.isVisible).toEventually(beTrue())
                    }
                }
            }
        }
    }
}
#endif
