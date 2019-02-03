//
//  DataExtensionTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 19/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import AurorKit

class DataExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        context("Instance Properties", {
            describe(".hexEncoded", {
                it("should return an empty string", closure: {
                    let data = Data()

                    expect(data.hexEncoded).to(beEmpty())
                })

                it("should return the data as a HEX string", closure: {
                    let data = Data([0, 1, 10, 16, 128, 255])

                    expect(data.hexEncoded).to(equal("00010a1080ff"))
                })
            })
        })
    }
}
