import Foundation

import Quick
import Nimble

@testable import AurorKit

class CollectionExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".contains(index:)") {
            it("should contains the index") {
                let collection = [1, 2, 3, 4, 5]

                expect(collection.contains(index: 0)).to(beTrue())
            }

            it("should contains the index") {
                let collection = [1, 2, 3, 4, 5]

                expect(collection.contains(index: 4)).to(beTrue())
            }

            it("should not contains the index") {
                let collection = [1, 2, 3, 4, 5]

                expect(collection.contains(index: 5)).to(beFalse())
            }
        }

        describe(".split(maxSplits:by:)") {
            it("should return an empty collection") {
                let collection = [Int]().split(maxSplits: 1, by: { $0 == $1 })

                expect(collection).to(beEmpty())
            }

            it("should return a properly split collection") {
                let collection = [1, 2, 3, 4, 5].split(maxSplits: 0, by: { $0 == $1 })

                expect(collection).to(equal([[1, 2, 3, 4, 5]]))
            }

            it("should return a properly split collection") {
                let collection = [1, 2, 3, 4, 5].split(maxSplits: 1, by: { $0 != $1 })

                expect(collection).to(equal([[1], [2, 3, 4, 5]]))
            }

            it("should return a properly split collection") {
                let collection = [1, 2, 3, 4, 5].split(maxSplits: 5, by: { $0 != $1 })

                expect(collection).to(equal([[1], [2], [3], [4], [5]]))
            }

            it("should return a properly split collection") {
                let collection = [1, 1, 2, 3, 3, 3].split(maxSplits: 3, by: { $0 != $1 })

                expect(collection).to(equal([[1, 1], [2], [3, 3, 3]]))
            }
        }

        describe(".split(by:)") {
            it("should return an empty collection") {
                let collection = [Int]().split(by: { $0 == $1 })

                expect(collection).to(beEmpty())
            }

            it("should return a properly split collection") {
                let collection = [1, 2, 3, 4, 5].split(by: { $0 != $1 })

                expect(collection).to(equal([[1], [2], [3], [4], [5]]))
            }

            it("should return a properly split collection") {
                let collection = [1, 1, 2, 3, 3, 3].split(by: { $0 != $1 })

                expect(collection).to(equal([[1, 1], [2], [3, 3, 3]]))
            }
        }

        describe(".subscript(safe:)") {
            it("should return an element") {
                let collection = [1, 2, 3, 4, 5]

                expect(collection[safe: 0]).to(equal(1))
            }

            it("should return an element") {
                let collection = [1, 2, 3, 4, 5]

                expect(collection[safe: 4]).to(equal(5))
            }

            it("should return nil") {
                let collection = [1, 2, 3, 4, 5]

                expect(collection[safe: 5]).to(beNil())
            }
        }

        describe(".unique()") {
            it("should return an array of unique elements") {
                let collection = [1, 2, 3]

                expect(collection.unique()).to(equal([1, 2, 3]))
            }

            it("should return an array of unique elements") {
                let collection = [1, 1, 2, 2, 2, 3]

                expect(collection.unique()).to(equal([1, 2, 3]))
            }

            it("should return an array of unique elements") {
                let collection: [Int] = []

                expect(collection.unique()).to(equal([]))
            }
        }
    }
}
