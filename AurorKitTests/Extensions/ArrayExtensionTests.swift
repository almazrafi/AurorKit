//
//  ArrayExtensionTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 19/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import AurorKit

class ArrayExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        context("Instance Methods", {
            describe(".removeLast(where:)", {
                it("should not change the array", closure: {
                    var array: [Int] = []

                    array.removeLast(where: { ($0 % 2) == 0 })

                    expect(array).to(beEmpty())
                })

                it("should remove the last even number", closure: {
                    var array = [1, 2, 3, 4, 5]

                    array.removeLast(where: { ($0 % 2) == 0 })

                    expect(array).to(equal([1, 2, 3, 5]))
                })

                it("should not change the array", closure: {
                    var array = [1, 3, 5, 7]

                    array.removeLast(where: { ($0 % 2) == 0 })

                    expect(array).to(equal([1, 3, 5, 7]))
                })
            })
        })
    }
}
