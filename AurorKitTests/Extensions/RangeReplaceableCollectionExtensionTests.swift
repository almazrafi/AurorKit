//
//  RangeReplaceableCollectionExtensionTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 19/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import AurorKit

class RangeReplaceableCollectionExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        context("Instance Methods", {
            describe(".removeFirst(where:)", {
                it("should not change the array", closure: {
                    var collection: [Int] = []

                    collection.removeFirst(where: { ($0 % 2) == 0 })

                    expect(collection).to(equal([]))
                })

                it("should remove the first even number", closure: {
                    var collection = [1, 2, 3, 4, 5]

                    collection.removeFirst(where: { ($0 % 2) == 0 })

                    expect(collection).to(equal([1, 3, 4, 5]))
                })

                it("should not change the array", closure: {
                    var collection = [1, 3, 5, 7]

                    collection.removeFirst(where: { ($0 % 2) == 0 })

                    expect(collection).to(equal([1, 3, 5, 7]))
                })
            })

            describe(".prepend(contentsOf:)", {
                it("should prepend elements to the collection", closure: {
                    var collection: [Int] = []

                    collection.prepend(contentsOf: [1, 2, 3])

                    expect(collection).to(equal([1, 2, 3]))
                })

                it("should prepend elements to the collection", closure: {
                    var collection = [4, 5, 6]

                    collection.prepend(contentsOf: [1, 2, 3])

                    expect(collection).to(equal([1, 2, 3, 4, 5, 6]))
                })

                it("should not change the array", closure: {
                    var collection = [1, 2, 3]

                    collection.prepend(contentsOf: [])

                    expect(collection).to(equal([1, 2, 3]))
                })
            })

            describe(".prepend(:)", {
                it("should prepend an element to the collection", closure: {
                    var collection: [Int] = []

                    collection.prepend(123)

                    expect(collection).to(equal([123]))
                })

                it("should prepend an element to the collection", closure: {
                    var collection = [4, 5, 6]

                    collection.prepend(123)

                    expect(collection).to(equal([123, 4, 5, 6]))
                })
            })
        })
    }
}
