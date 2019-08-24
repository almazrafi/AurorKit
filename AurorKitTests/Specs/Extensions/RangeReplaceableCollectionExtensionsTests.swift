import Foundation

import Quick
import Nimble

@testable import AurorKit

class RangeReplaceableCollectionExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".removeFirst(where:)") {
            it("should not change the array") {
                var collection: [Int] = []

                collection.removeFirst(where: { ($0 % 2) == 0 })

                expect(collection).to(equal([]))
            }

            it("should remove the first even number") {
                var collection = [1, 2, 3, 4, 5]

                collection.removeFirst(where: { ($0 % 2) == 0 })

                expect(collection).to(equal([1, 3, 4, 5]))
            }

            it("should not change the array") {
                var collection = [1, 3, 5, 7]

                collection.removeFirst(where: { ($0 % 2) == 0 })

                expect(collection).to(equal([1, 3, 5, 7]))
            }
        }

        describe(".prepend(contentsOf:)") {
            it("should prepend elements to the collection") {
                var collection: [Int] = []

                collection.prepend(contentsOf: [1, 2, 3])

                expect(collection).to(equal([1, 2, 3]))
            }

            it("should prepend elements to the collection") {
                var collection = [4, 5, 6]

                collection.prepend(contentsOf: [1, 2, 3])

                expect(collection).to(equal([1, 2, 3, 4, 5, 6]))
            }

            it("should not change the array") {
                var collection = [1, 2, 3]

                collection.prepend(contentsOf: [])

                expect(collection).to(equal([1, 2, 3]))
            }
        }

        describe(".prepend(_:)") {
            it("should prepend an element to the collection") {
                var collection: [Int] = []

                collection.prepend(123)

                expect(collection).to(equal([123]))
            }

            it("should prepend an element to the collection") {
                var collection = [4, 5, 6]

                collection.prepend(123)

                expect(collection).to(equal([123, 4, 5, 6]))
            }
        }

        describe(".prepending(contentsOf:)") {
            it("should return a new collection with prepended elements") {
                let collection: [Int] = []

                expect(collection.prepending(contentsOf: [1, 2, 3])).to(equal([1, 2, 3]))
            }

            it("should return a new collection with prepended elements") {
                let collection = [4, 5, 6]

                expect(collection.prepending(contentsOf: [1, 2, 3])).to(equal([1, 2, 3, 4, 5, 6]))
            }

            it("should not change the array") {
                let collection = [1, 2, 3]

                expect(collection.prepending(contentsOf: [])).to(equal([1, 2, 3]))
            }
        }

        describe(".prepending(_:)") {
            it("should return a new collection with prepended element") {
                let collection: [Int] = []

                expect(collection.prepending(123)).to(equal([123]))
            }

            it("should return a new collection with prepended element") {
                let collection = [4, 5, 6]

                expect(collection.prepending(123)).to(equal([123, 4, 5, 6]))
            }
        }

        describe(".appending(contentsOf:)") {
            it("should return a new collection with appended elements") {
                let collection: [Int] = []

                expect(collection.appending(contentsOf: [1, 2, 3])).to(equal([1, 2, 3]))
            }

            it("should return a new collection with appended elements") {
                let collection = [4, 5, 6]

                expect(collection.appending(contentsOf: [1, 2, 3])).to(equal([4, 5, 6, 1, 2, 3]))
            }

            it("should not change the array") {
                let collection = [1, 2, 3]

                expect(collection.appending(contentsOf: [])).to(equal([1, 2, 3]))
            }
        }

        describe(".appending(_:)") {
            it("should return a new collection with appended element") {
                let collection: [Int] = []

                expect(collection.appending(123)).to(equal([123]))
            }

            it("should return a new collection with appended element") {
                let collection = [4, 5, 6]

                expect(collection.appending(123)).to(equal([4, 5, 6, 123]))
            }
        }
    }
}
