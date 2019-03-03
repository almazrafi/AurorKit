//
//  StringExtensionTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 20/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import AurorKit

class StringExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".localized(tableName:comment:)") {
            it("should return an empty string") {
                let string = ""

                expect(string.localized(tableName: nil, comment: "")).to(beEmpty())
            }

            it("should return a non-localized string") {
                let string = "String"

                expect(string.localized(tableName: nil, comment: "")).to(equal("String"))
            }
        }

        describe(".prefix(count:)") {
            it("should return an empty string") {
                let string = ""

                expect(string.prefix(count: -1)).to(beEmpty())
            }

            it("should return an empty string") {
                let string = ""

                expect(string.prefix(count: 0)).to(beEmpty())
            }

            it("should return an empty string") {
                let string = ""

                expect(string.prefix(count: 1)).to(beEmpty())
            }

            it("should return an empty string") {
                let string = "123456"

                expect(string.prefix(count: -1)).to(beEmpty())
            }

            it("should return an empty string") {
                let string = "123456"

                expect(string.prefix(count: 0)).to(beEmpty())
            }

            it("should return a string prefix") {
                let string = "123456"

                expect(string.prefix(count: 5)).to(equal("12345"))
            }

            it("should return a string prefix") {
                let string = "123456"

                expect(string.prefix(count: 6)).to(equal("123456"))
            }

            it("should return a string prefix") {
                let string = "123456"

                expect(string.prefix(count: 7)).to(equal("123456"))
            }
        }

        describe(".suffix(count:)") {
            it("should return an empty string") {
                let string = ""

                expect(string.suffix(from: -1)).to(beEmpty())
            }

            it("should return an empty string") {
                let string = ""

                expect(string.suffix(from: 0)).to(beEmpty())
            }

            it("should return an empty string") {
                let string = ""

                expect(string.suffix(from: 1)).to(beEmpty())
            }

            it("should return a string suffix") {
                let string = "123456"

                expect(string.suffix(from: -1)).to(equal("123456"))
            }

            it("should return a string suffix") {
                let string = "123456"

                expect(string.suffix(from: 0)).to(equal("123456"))
            }

            it("should return a string suffix") {
                let string = "123456"

                expect(string.suffix(from: 5)).to(equal("6"))
            }

            it("should return a string suffix") {
                let string = "123456"

                expect(string.suffix(from: 6)).to(beEmpty())
            }

            it("should return a string suffix") {
                let string = "123456"

                expect(string.suffix(from: 7)).to(beEmpty())
            }
        }
    }
}
