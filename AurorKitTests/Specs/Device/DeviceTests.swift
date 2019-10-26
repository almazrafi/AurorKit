import Foundation
import Quick
import Nimble

@testable import AurorKit

class DeviceTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe("Device") {
            it("should have a known model for the current device") {
                expect(Device.current.modelIdentifier).toNot(beEmpty())
            }

            it("should have a non-empty model name for the current device") {
                expect(Device.current.modelName).toNot(beEmpty())
            }

            it("should have a non-empty model identifier for the current device") {
                expect(Device.current.modelIdentifier).toNot(beEmpty())
            }
        }
    }
}
