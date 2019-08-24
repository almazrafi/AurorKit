import Foundation

import Quick
import Nimble

@testable import AurorKit

class ArrayExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".removeLast(where:)") {
            it("should not change the array") {
                var array: [Int] = []

                array.removeLast(where: { ($0 % 2) == 0 })

                expect(array).to(beEmpty())
            }

            it("should remove the last even number") {
                var array = [1, 2, 3, 4, 5]

                array.removeLast(where: { ($0 % 2) == 0 })

                expect(array).to(equal([1, 2, 3, 5]))
            }

            it("should not change the array") {
                var array = [1, 3, 5, 7]

                array.removeLast(where: { ($0 % 2) == 0 })

                expect(array).to(equal([1, 3, 5, 7]))
            }
        }
    }
}
