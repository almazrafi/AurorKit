#if canImport(UIKit) && !os(watchOS)
import UIKit
import Quick
import Nimble

@testable import AurorKit

class UIWindowExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var window: UIWindow!

        beforeEach {
            window = UIWindow(frame: UIScreen.main.bounds)

            window.isHidden = false
        }

        describe(".topViewController") {
            context("when window has no root view controller") {
                it("should return nil") {
                    expect(window.topViewController).to(beNil())
                }
            }

            context("when window has root view controller") {
                var rootViewController: UIViewController!

                beforeEach {
                    rootViewController = UIViewController()

                    window.rootViewController = rootViewController
                }

                it("should return root view controller") {
                    expect(window.topViewController).to(beIdenticalTo(rootViewController))
                }

                context("when modal view controller is presented") {
                    var modalViewController: UIViewController!

                    beforeEach {
                        modalViewController = UIViewController()

                        rootViewController.present(modalViewController, animated: true)
                    }

                    it("should return first modal view controller") {
                        expect(window.topViewController).toEventually(beIdenticalTo(modalViewController))
                    }
                }
            }
        }
    }
}
#endif
