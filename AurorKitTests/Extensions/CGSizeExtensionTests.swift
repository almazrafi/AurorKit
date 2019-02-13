//
//  CGSizeExtensionTests.swift
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

class CGSizeExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".init(equilateral:)") {
            it("should initialize properly") {
                let size = CGSize(equilateral: CGFloat(1.23))

                expect(size.width).to(equal(1.23))
                expect(size.height).to(equal(1.23))
            }

            it("should initialize properly") {
                let size = CGSize(equilateral: Double(1.23))

                expect(size.width).to(equal(1.23))
                expect(size.height).to(equal(1.23))
            }

            it("should initialize properly") {
                let size = CGSize(equilateral: Int(123))

                expect(size.width).to(equal(123.0))
                expect(size.height).to(equal(123.0))
            }
        }

        describe(".adjusted") {
            it("should return a properly adjusted size") {
                let size = CGSize(width: 1.4, height: 2.5).adjusted

                expect(size).to(equal(CGSize(width: 2.0, height: 3.0)))
            }

            it("should return a properly adjusted size") {
                let size = CGSize(width: 1.5, height: 2.6).adjusted

                expect(size).to(equal(CGSize(width: 2.0, height: 3.0)))
            }

            it("should return a properly adjusted size") {
                let size = CGSize(width: -1.4, height: -2.5).adjusted

                expect(size).to(equal(CGSize(width: -2.0, height: -3.0)))
            }

            it("should return a properly adjusted size") {
                let size = CGSize(width: -1.5, height: -2.6).adjusted

                expect(size).to(equal(CGSize(width: -2.0, height: -3.0)))
            }
        }
    }
}
