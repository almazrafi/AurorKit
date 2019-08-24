import Foundation
import Quick
import Nimble

@testable import AurorKit

class DictionaryExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe("Dictionary where Value is a Collection") {
            var dictionary: [String: [Int]]!

            beforeEach {
                dictionary = ["foo": [1, 2, 3]]
            }

            describe(".append(contentsOf:toValueOfKey:)") {
                it("should append the elements of a sequence to the value if the given key is present.") {
                    dictionary.append(contentsOf: [4, 5, 6], toCollectionOfKey: "foo")

                    expect(dictionary["foo"]).to(equal([1, 2, 3, 4, 5, 6]))
                }

                it("should add key-value pair with elements of a sequence if the given key is not present") {
                    dictionary.append(contentsOf: [4, 5, 6], toCollectionOfKey: "bar")

                    expect(dictionary["bar"]).to(equal([4, 5, 6]))
                }
            }

            describe(".append(:toValueOfKey:)") {
                it("should append a new element to the value if the given key is present.") {
                    dictionary.append(456, toCollectionOfKey: "foo")

                    expect(dictionary["foo"]).to(equal([1, 2, 3, 456]))
                }

                it("should add key-value pair with a new element if the given key is not present") {
                    dictionary.append(456, toCollectionOfKey: "bar")

                    expect(dictionary["bar"]).to(equal([456]))
                }
            }

            describe(".prepend(contentsOf:toValueOfKey:)") {
                it("should prepend the elements of a sequence to the value if the given key is present.") {
                    dictionary.prepend(contentsOf: [4, 5, 6], toCollectionOfKey: "foo")

                    expect(dictionary["foo"]).to(equal([4, 5, 6, 1, 2, 3]))
                }

                it("should add key-value pair with elements of a sequence if the given key is not present") {
                    dictionary.prepend(contentsOf: [4, 5, 6], toCollectionOfKey: "bar")

                    expect(dictionary["bar"]).to(equal([4, 5, 6]))
                }
            }

            describe(".prepend(:toValueOfKey:)") {
                it("should prepend a new element to the value if the given key is present.") {
                    dictionary.prepend(456, toCollectionOfKey: "foo")

                    expect(dictionary["foo"]).to(equal([456, 1, 2, 3]))
                }

                it("should add key-value pair with a new element if the given key is not present") {
                    dictionary.prepend(456, toCollectionOfKey: "bar")

                    expect(dictionary["bar"]).to(equal([456]))
                }
            }

            describe(".appending(contentsOf:toValueOfKey:)") {
                it("should return a copy of the dictionary with the appended sequence elements") {
                    let newDictionary = dictionary.appending(contentsOf: [4, 5, 6], toCollectionOfKey: "foo")

                    expect(newDictionary).to(equal(["foo": [1, 2, 3, 4, 5, 6]]))
                }
            }

            describe(".appending(:toValueOfKey:)") {
                it("should return a copy of the dictionary with the appended element") {
                    let newDictionary = dictionary.appending(456, toCollectionOfKey: "foo")

                    expect(newDictionary).to(equal(["foo": [1, 2, 3, 456]]))
                }
            }

            describe(".prepending(contentsOf:toValueOfKey:)") {
                it("should return a copy of the dictionary with the appended sequence elements") {
                    let newDictionary = dictionary.prepending(contentsOf: [4, 5, 6], toCollectionOfKey: "foo")

                    expect(newDictionary).to(equal(["foo": [4, 5, 6, 1, 2, 3]]))
                }
            }

            describe(".prepending(:toValueOfKey:)") {
                it("should return a copy of the dictionary with the appended element") {
                    let newDictionary = dictionary.prepending(456, toCollectionOfKey: "foo")

                    expect(newDictionary).to(equal(["foo": [456, 1, 2, 3]]))
                }
            }
        }
    }
}
