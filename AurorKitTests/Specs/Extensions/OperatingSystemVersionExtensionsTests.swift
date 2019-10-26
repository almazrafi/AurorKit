import Foundation
import Quick
import Nimble

@testable import AurorKit

class OperatingSystemVersionExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".fullVersion") {
            it("should return full system version") {
                let version = OperatingSystemVersion(majorVersion: 1, minorVersion: 2, patchVersion: 3)

                expect(version.fullVersion).to(equal("1.2.3"))
            }

            it("should return only major and minor versions if patch is 0") {
                let version = OperatingSystemVersion(majorVersion: 123, minorVersion: 0, patchVersion: 0)

                expect(version.fullVersion).to(equal("123.0"))
            }
        }
    }
}
