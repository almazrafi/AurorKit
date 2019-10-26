#if canImport(UIKit) && !os(watchOS)
import UIKit
import Quick
import Nimble

@testable import AurorKit

class UIDeviceExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".modelIdentifier") {
            it("should return a non-empty model identifier of the device") {
                expect(UIDevice.current.modelIdentifier).toNot(beEmpty())
            }
        }

        describe(".modelName") {
            it("should return a non-empty model name of the device") {
                expect(UIDevice.current.modelName).toNot(beEmpty())
            }
        }
    }
}
#endif
