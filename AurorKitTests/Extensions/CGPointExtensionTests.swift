//
//  CGPointExtensionTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 19/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation
import CoreGraphics

import Quick
import Nimble

@testable import AurorKit

class CGPointExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        context("Instance Properties", {
            describe(".adjusted", {
                it("should return the adjusted point", closure: {
                    let point = CGPoint(x: 1.4, y: 2.5).adjusted

                    expect(point).to(equal(CGPoint(x: 1.0, y: 2.0)))
                })

                it("should return the adjusted point", closure: {
                    let point = CGPoint(x: 1.5, y: 2.6).adjusted

                    expect(point).to(equal(CGPoint(x: 1.0, y: 2.0)))
                })

                it("should return the adjusted point", closure: {
                    let point = CGPoint(x: -1.4, y: -2.5).adjusted

                    expect(point).to(equal(CGPoint(x: -2.0, y: -3.0)))
                })

                it("should return the adjusted point", closure: {
                    let point = CGPoint(x: -1.5, y: -2.6).adjusted

                    expect(point).to(equal(CGPoint(x: -2.0, y: -3.0)))
                })
            })
        })
    }
}
