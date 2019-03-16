//
//  ComparableExtensionTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 13/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import AurorKit

class ComparableExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".clampBetween(lowerBound:upperBound:)") {
            it("should clamp the number properly") {
                var number = 456

                number.clampBetween(lowerBound: 123, upperBound: 789)

                expect(number).to(equal(456))
            }

            it("should clamp the number properly") {
                var number = 123

                number.clampBetween(lowerBound: 123, upperBound: 456)

                expect(number).to(equal(123))
            }

            it("should clamp the number properly") {
                var number = 456

                number.clampBetween(lowerBound: 123, upperBound: 456)

                expect(number).to(equal(456))
            }

            it("should clamp the number properly") {
                var number = 123

                number.clampBetween(lowerBound: 456, upperBound: 789)

                expect(number).to(equal(456))
            }

            it("should clamp the number properly") {
                var number = 789

                number.clampBetween(lowerBound: 123, upperBound: 456)

                expect(number).to(equal(456))
            }

            it("should clamp the number properly") {
                var number = 456

                number.clampBetween(lowerBound: 123, upperBound: 123)

                expect(number).to(equal(123))
            }
        }

        describe(".clamp(to:)") {
            it("should clamp the number properly") {
                var number = 456

                number.clamp(to: 123...789)

                expect(number).to(equal(456))
            }

            it("should clamp the number properly") {
                var number = 123

                number.clamp(to: 123...456)

                expect(number).to(equal(123))
            }

            it("should clamp the number properly") {
                var number = 456

                number.clamp(to: 123...456)

                expect(number).to(equal(456))
            }

            it("should clamp the number properly") {
                var number = 123

                number.clamp(to: 456...789)

                expect(number).to(equal(456))
            }

            it("should clamp the number properly") {
                var number = 789

                number.clamp(to: 123...456)

                expect(number).to(equal(456))
            }

            it("should clamp the number properly") {
                var number = 456

                number.clamp(to: 123...123)

                expect(number).to(equal(123))
            }
        }

        describe(".clampedBetween(lowerBound:upperBound:)") {
            it("should return a properly clamped number") {
                let number = 456.clampedBetween(lowerBound: 123, upperBound: 789)

                expect(number).to(equal(456))
            }

            it("should return a properly clamped number") {
                let number = 123.clampedBetween(lowerBound: 123, upperBound: 456)

                expect(number).to(equal(123))
            }

            it("should return a properly clamped number") {
                let number = 456.clampedBetween(lowerBound: 123, upperBound: 456)

                expect(number).to(equal(456))
            }

            it("should return a properly clamped number") {
                let number = 123.clampedBetween(lowerBound: 456, upperBound: 789)

                expect(number).to(equal(456))
            }

            it("should return a properly clamped number") {
                let number = 789.clampedBetween(lowerBound: 123, upperBound: 456)

                expect(number).to(equal(456))
            }

            it("should return a properly clamped number") {
                let number = 456.clampedBetween(lowerBound: 123, upperBound: 123)

                expect(number).to(equal(123))
            }
        }

        describe(".clamped(to:)") {
            it("should return a properly clamped number") {
                let number = 456.clamped(to: 123...789)

                expect(number).to(equal(456))
            }

            it("should return a properly clamped number") {
                let number = 123.clamped(to: 123...456)

                expect(number).to(equal(123))
            }

            it("should return a properly clamped number") {
                let number = 456.clamped(to: 123...456)

                expect(number).to(equal(456))
            }

            it("should return a properly clamped number") {
                let number = 123.clamped(to: 456...789)

                expect(number).to(equal(456))
            }

            it("should return a properly clamped number") {
                let number = 789.clamped(to: 123...456)

                expect(number).to(equal(456))
            }

            it("should return a properly clamped number") {
                let number = 456.clamped(to: 123...123)

                expect(number).to(equal(123))
            }
        }
    }
}
