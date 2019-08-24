import Foundation

import Quick
import Nimble

@testable import AurorKit

class DataExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".hexEncoded") {
            it("should return an empty string") {
                let data = Data()

                expect(data.hexEncoded).to(beEmpty())
            }

            it("should return the data as a HEX string") {
                let data = Data([0, 1, 10, 16, 128, 255])

                expect(data.hexEncoded).to(equal("00010a1080ff"))
            }
        }
    }
}
