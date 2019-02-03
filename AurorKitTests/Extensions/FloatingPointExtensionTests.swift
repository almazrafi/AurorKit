//
//  FloatingPointExtensionTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 19/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import AurorKit

class FloatingPointExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        context("Instance Properties", {
            describe(".degreesToRadians", {
                it("should return a value in radians", closure: {
                    let degrees = 0.0

                    expect(degrees.degreesToRadians).to(equal(0.0))
                })

                it("should return a value in radians", closure: {
                    let degrees = 90.0

                    expect(degrees.degreesToRadians).to(equal(Double.pi / 2.0))
                })

                it("should return a value in radians", closure: {
                    let degrees = 180.0

                    expect(degrees.degreesToRadians).to(equal(Double.pi))
                })

                it("should return a value in radians", closure: {
                    let degrees = 360.0

                    expect(degrees.degreesToRadians).to(equal(Double.pi * 2))
                })
            })

            describe(".radiansToDegrees", {
                it("should return a value in degrees", closure: {
                    let radians = 0.0

                    expect(radians.radiansToDegrees).to(equal(0.0))
                })

                it("should return a value in degrees", closure: {
                    let radians = Double.pi / 2.0

                    expect(radians.radiansToDegrees).to(equal(90.0))
                })

                it("should return a value in degrees", closure: {
                    let radians = Double.pi

                    expect(radians.radiansToDegrees).to(equal(180.0))
                })

                it("should return a value in degrees", closure: {
                    let radians = Double.pi * 2.0

                    expect(radians.radiansToDegrees).to(equal(360.0))
                })
            })
        })
    }
}
