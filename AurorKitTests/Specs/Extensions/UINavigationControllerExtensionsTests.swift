#if canImport(UIKit) && !os(watchOS)
import UIKit
import Quick
import Nimble

@testable import AurorKit

class UINavigationControllerExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".pushViewControllers(:animated:)") {
            var rootViewController: UIViewController!
            var navigationController: UINavigationController!

            beforeEach {
                rootViewController = UIViewController()
                navigationController = UINavigationController(rootViewController: rootViewController)
            }

            it("should add controllers to the navigation stack") {
                let pushViewControllers = [UIViewController(), UIViewController(), UIViewController()]
                let expectedViewControllers = [navigationController.viewControllers, pushViewControllers].flatMap { $0 }

                navigationController.pushViewControllers(pushViewControllers, animated: false)

                expect(navigationController.viewControllers.count).toEventually(equal(expectedViewControllers.count))

                for i in 0..<min(navigationController.viewControllers.count, expectedViewControllers.count) {
                    expect(navigationController.viewControllers[i]).to(be(expectedViewControllers[i]))
                }
            }
        }
    }
}
#endif
