//
//  CGRectExtensionTests.swift
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

class CGRectExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        context("Instance Properties", {
            describe(".top", {
                it("should return the correct coordinate", closure: {
                    let top = CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).top

                    expect(top).to(equal(2.0))
                })

                it("should return the correct coordinate", closure: {
                    let top = CGRect(x: -1.0, y: -2.0, width: -3.0, height: -4.0).top

                    expect(top).to(equal(-6.0))
                })
            })

            describe(".left", {
                it("should return the correct coordinate", closure: {
                    let left = CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).left

                    expect(left).to(equal(1.0))
                })

                it("should return the correct coordinate", closure: {
                    let left = CGRect(x: -1.0, y: -2.0, width: -3.0, height: -4.0).left

                    expect(left).to(equal(-4.0))
                })
            })

            describe(".bottom", {
                it("should return the correct coordinate", closure: {
                    let bottom = CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).bottom

                    expect(bottom).to(equal(6.0))
                })

                it("should return the correct coordinate", closure: {
                    let bottom = CGRect(x: -1.0, y: -2.0, width: -3.0, height: -4.0).bottom

                    expect(bottom).to(equal(-2.0))
                })
            })

            describe(".right", {
                it("should return the correct coordinate", closure: {
                    let right = CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0).right

                    expect(right).to(equal(4.0))
                })

                it("should return the correct coordinate", closure: {
                    let right = CGRect(x: -1.0, y: -2.0, width: -3.0, height: -4.0).right

                    expect(right).to(equal(-1.0))
                })
            })

            describe(".adjusted", {
                it("should return the adjusted rect", closure: {
                    let rect = CGRect(x: 1.4, y: 2.5, width: 3.4, height: 4.5).adjusted

                    expect(rect).to(equal(CGRect(x: 1.0, y: 2.0, width: 4.0, height: 5.0)))
                })

                it("should return the adjusted rect", closure: {
                    let rect = CGRect(x: 1.5, y: 2.6, width: 3.5, height: 4.6).adjusted

                    expect(rect).to(equal(CGRect(x: 1.0, y: 2.0, width: 4.0, height: 5.0)))
                })

                it("should return the adjusted rect", closure: {
                    let rect = CGRect(x: -1.4, y: -2.5, width: 3.4, height: 4.5).adjusted

                    expect(rect).to(equal(CGRect(x: -2.0, y: -3.0, width: 4.0, height: 5.0)))
                })

                it("should return the adjusted rect", closure: {
                    let rect = CGRect(x: -1.5, y: -2.6, width: 3.5, height: 4.6).adjusted

                    expect(rect).to(equal(CGRect(x: -2.0, y: -3.0, width: 4.0, height: 5.0)))
                })

                it("should return the adjusted rect", closure: {
                    let rect = CGRect(x: -1.4, y: -2.5, width: -3.4, height: -4.5).adjusted

                    expect(rect).to(equal(CGRect(x: -5.0, y: -7.0, width: 4.0, height: 5.0)))
                })

                it("should return the adjusted rect", closure: {
                    let rect = CGRect(x: -1.5, y: -2.6, width: -3.5, height: -4.6).adjusted

                    expect(rect).to(equal(CGRect(x: -5.0, y: -8.0, width: 4.0, height: 5.0)))
                })
            })
        })

        context("Initializers", {
            describe(".init(x:, y:, size:)", {
                it("should initialize properly", closure: {
                    let rect = CGRect(x: CGFloat(1.2),
                                      y: CGFloat(3.4),
                                      size: CGSize(width: 5.6, height: 7.8))

                    expect(rect.origin.x).to(equal(1.2))
                    expect(rect.origin.y).to(equal(3.4))
                    expect(rect.size.width).to(equal(5.6))
                    expect(rect.size.height).to(equal(7.8))
                })

                it("should initialize properly", closure: {
                    let rect = CGRect(x: Double(1.2),
                                      y: Double(3.4),
                                      size: CGSize(width: 5.6, height: 7.8))

                    expect(rect.origin.x).to(equal(1.2))
                    expect(rect.origin.y).to(equal(3.4))
                    expect(rect.size.width).to(equal(5.6))
                    expect(rect.size.height).to(equal(7.8))
                })

                it("should initialize properly", closure: {
                    let rect = CGRect(x: Int(12),
                                      y: Int(34),
                                      size: CGSize(width: 56, height: 78))

                    expect(rect.origin.x).to(equal(12.0))
                    expect(rect.origin.y).to(equal(34.0))
                    expect(rect.size.width).to(equal(56.0))
                    expect(rect.size.height).to(equal(78.0))
                })
            })

            describe(".init(origin:, width:, height:)", {
                it("should initialize properly", closure: {
                    let rect = CGRect(origin: CGPoint(x: 1.2, y: 3.4),
                                      width: CGFloat(5.6),
                                      height: CGFloat(7.8))

                    expect(rect.origin.x).to(equal(1.2))
                    expect(rect.origin.y).to(equal(3.4))
                    expect(rect.size.width).to(equal(5.6))
                    expect(rect.size.height).to(equal(7.8))
                })

                it("should initialize properly", closure: {
                    let rect = CGRect(origin: CGPoint(x: 1.2, y: 3.4),
                                      width: Double(5.6),
                                      height: Double(7.8))

                    expect(rect.origin.x).to(equal(1.2))
                    expect(rect.origin.y).to(equal(3.4))
                    expect(rect.size.width).to(equal(5.6))
                    expect(rect.size.height).to(equal(7.8))
                })

                it("should initialize properly", closure: {
                    let rect = CGRect(origin: CGPoint(x: 12, y: 34),
                                      width: Int(56),
                                      height: Int(78))

                    expect(rect.origin.x).to(equal(12.0))
                    expect(rect.origin.y).to(equal(34.0))
                    expect(rect.size.width).to(equal(56.0))
                    expect(rect.size.height).to(equal(78.0))
                })
            })
        })
    }
}
