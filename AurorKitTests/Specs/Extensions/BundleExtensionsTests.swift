import Foundation
import Quick
import Nimble

@testable import AurorKit

class BundleExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var bundle: Bundle!

        beforeEach {
            bundle = Bundle(for: type(of: self))
        }

        describe(".bundleName") {
            it("should return bundle name of the app") {
                expect(bundle.bundleName).to(beginWith("AurorKit Tests"))
            }
        }

        describe(".developmentRegion") {
            it("should return development region of the app") {
                expect(bundle.developmentRegion).to(equal("en"))
            }
        }

        describe(".displayName") {
            it("should return display name of the app") {
                expect(bundle.displayName).to(beginWith("AurorKit Tests"))
            }
        }

        describe(".executableName") {
            it("should return executable name of the app") {
                expect(bundle.executableName).to(beginWith("AurorKit Tests"))
            }
        }

        describe(".version") {
            it("should return version of the app") {
                expect(bundle.version).to(equal("1.0"))
            }
        }

        describe(".build") {
            it("should return build number of the app") {
                expect(bundle.build).to(equal("1"))
            }
        }

        describe("string(forInfoDictionaryKey:)") {
            it("should return the correct string") {
                expect(bundle.string(forInfoDictionaryKey: "TestString")).to(equal("Text 123"))
            }

            it("should return nil if key is not specified") {
                expect(bundle.string(forInfoDictionaryKey: "TestNil")).to(beNil())
            }
        }

        describe("url(forInfoDictionaryKey:)") {
            it("should return the correct string") {
                expect(bundle.url(forInfoDictionaryKey: "TestURL")).to(equal(URL(string: "https://swift.org")))
            }

            it("should return nil if value is invalid URL") {
                expect(bundle.url(forInfoDictionaryKey: "TestString")).to(beNil())
            }

            it("should return nil if key is not specified") {
                expect(bundle.url(forInfoDictionaryKey: "TestNil")).to(beNil())
            }
        }
    }
}
