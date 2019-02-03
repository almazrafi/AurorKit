//
//  UIImageExtensionTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 20/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIImageExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        context("Instance Methods", {
            describe(".scaled(to:)", {
                it("should return nil", closure: {
                    let image = UIImage().scaled(to: CGSize(width: 0, height: 0))

                    expect(image).to(beNil())
                })

                it("should return nil", closure: {
                    let image = UIImage().scaled(to: CGSize(width: 123, height: 0))

                    expect(image).to(beNil())
                })

                it("should return nil", closure: {
                    let image = UIImage().scaled(to: CGSize(width: 0, height: 123))

                    expect(image).to(beNil())
                })

                it("should return a properly scaled image", closure: {
                    let image = UIImage().scaled(to: CGSize(width: 123, height: 456))

                    expect(image?.size).to(equal(CGSize(width: 123, height: 456)))
                })
            })

            describe(".scaledToWidth(:)", {
                it("should return nil", closure: {
                    let image = UIImage().scaledToWidth(0.0)

                    expect(image).to(beNil())
                })

                it("should return a properly scaled image", closure: {
                    let image = UIImage().scaledToWidth(123)

                    expect(image?.size).to(equal(CGSize(width: 123, height: 123)))
                })

                it("should return nil", closure: {
                    let image = UIImage().scaled(to: CGSize(width: 12, height: 34))?.scaledToWidth(0)

                    expect(image).to(beNil())
                })

                it("should return a properly scaled image", closure: {
                    let image = UIImage().scaled(to: CGSize(width: 12, height: 34))?.scaledToWidth(24)

                    expect(image?.size).to(equal(CGSize(width: 24, height: 68)))
                })
            })

            describe(".scaledToHeight(:)", {
                it("should return nil", closure: {
                    let image = UIImage().scaledToHeight(0.0)

                    expect(image).to(beNil())
                })

                it("should return a properly scaled image", closure: {
                    let image = UIImage().scaledToHeight(123)

                    expect(image?.size).to(equal(CGSize(width: 123, height: 123)))
                })

                it("should return nil", closure: {
                    let image = UIImage().scaled(to: CGSize(width: 12, height: 34))?.scaledToHeight(0)

                    expect(image).to(beNil())
                })

                it("should return a properly scaled image", closure: {
                    let image = UIImage().scaled(to: CGSize(width: 12, height: 34))?.scaledToHeight(17)

                    expect(image?.size).to(equal(CGSize(width: 6, height: 17)))
                })
            })
        })
    }
}
