import Foundation

import Quick
import Nimble

@testable import AurorKit

class OptionalExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".isNil") {
            it("should return false if there is a value") {
                let optional: Int? = 123

                expect(optional.isNil).to(beFalse())
            }

            it("should return true if there is no value") {
                let optional: Int? = nil

                expect(optional.isNil).to(beTrue())
            }
        }

        describe(".isEmptyOrNil") {
            it("should return false if collection is not empty") {
                let optional: [Int]? = [1, 2, 3]

                expect(optional.isEmptyOrNil).to(beFalse())
            }

            it("should return true if collection is empty") {
                let optional: [Int]? = []

                expect(optional.isEmptyOrNil).to(beTrue())
            }

            it("should return true if there is no value") {
                let optional: [Int]? = nil

                expect(optional.isEmptyOrNil).to(beTrue())
            }
        }
    }
}
