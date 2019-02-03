//
//  UIColorExtensionTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 20/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIColorExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        context("Initializers", {
            describe(".init(red:, green:, blue:)", {
                it("should initialize properly", closure: {
                    let color = UIColor(red: 0.0, green: 0.123, blue: 1.0)

                    expect(color).to(equal(UIColor(red: 0.0, green: 0.123, blue: 1.0, alpha: 1.0)))
                })
            })

            describe(".init(white:)", {
                it("should initialize properly", closure: {
                    let color = UIColor(white: 0.0)

                    expect(color).to(equal(UIColor(white: 0.0, alpha: 1.0)))
                })

                it("should initialize properly", closure: {
                    let color = UIColor(white: 0.123)

                    expect(color).to(equal(UIColor(white: 0.123, alpha: 1.0)))
                })

                it("should initialize properly", closure: {
                    let color = UIColor(white: 1.0)

                    expect(color).to(equal(UIColor(white: 1.0, alpha: 1.0)))
                })
            })

            describe(".init(redByte:, greenByte:, blueByte:, alphaByte:)", {
                it("should initialize properly", closure: {
                    let color = UIColor(redByte: 0, greenByte: 123, blueByte: 255, alphaByte: 255)

                    expect(color).to(equal(UIColor(red: 0.0, green: 123.0 / 255.0, blue: 1.0, alpha: 1.0)))
                })
            })

            describe(".init(redByte:, greenByte:, blueByte:, alpha:)", {
                it("should initialize properly", closure: {
                    let color = UIColor(redByte: 0, greenByte: 123, blueByte: 255, alpha: 0.123)

                    expect(color).to(equal(UIColor(red: 0.0, green: 123.0 / 255.0, blue: 1.0, alpha: 0.123)))
                })

                it("should initialize properly", closure: {
                    let color = UIColor(redByte: 0, greenByte: 123, blueByte: 255)

                    expect(color).to(equal(UIColor(red: 0.0, green: 123.0 / 255.0, blue: 1.0, alpha: 1.0)))
                })
            })

            describe(".init(whiteByte:, alphaByte:)", {
                it("should initialize properly", closure: {
                    let color = UIColor(whiteByte: 0, alphaByte: 0)

                    expect(color).to(equal(UIColor(white: 0.0, alpha: 0.0)))
                })

                it("should initialize properly", closure: {
                    let color = UIColor(whiteByte: 123, alphaByte: 123)

                    expect(color).to(equal(UIColor(white: 123.0 / 255.0, alpha: 123.0 / 255.0)))
                })

                it("should initialize properly", closure: {
                    let color = UIColor(whiteByte: 255, alphaByte: 255)

                    expect(color).to(equal(UIColor(white: 1.0, alpha: 1.0)))
                })
            })

            describe(".init(whiteByte:, alpha:)", {
                it("should initialize properly", closure: {
                    let color = UIColor(whiteByte: 0, alpha: 0.0)

                    expect(color).to(equal(UIColor(white: 0.0, alpha: 0.0)))
                })

                it("should initialize properly", closure: {
                    let color = UIColor(whiteByte: 123, alpha: 0.123)

                    expect(color).to(equal(UIColor(white: 123.0 / 255.0, alpha: 0.123)))
                })

                it("should initialize properly", closure: {
                    let color = UIColor(whiteByte: 255, alpha: 1.0)

                    expect(color).to(equal(UIColor(white: 1.0, alpha: 1.0)))
                })
            })

            describe(".init(argbHEX:)", {
                it("should initialize properly", closure: {
                    let color = UIColor(argbHEX: 0x12345678)

                    expect(color).to(equal(UIColor(red: 52.0 / 255.0,
                                                   green: 86.0 / 255.0,
                                                   blue: 120.0 / 255.0,
                                                   alpha: 18.0 / 255.0)))
                })
            })

            describe(".init(rgbHEX:)", {
                it("should initialize properly", closure: {
                    let color = UIColor(rgbHEX: 0x123456)

                    expect(color).to(equal(UIColor(red: 18.0 / 255.0,
                                                   green: 52.0 / 255.0,
                                                   blue: 86.0 / 255.0,
                                                   alpha: 1.0)))
                })
            })
        })

        context("Instance Properties", {
            describe(".argbHEXString", {
                it("should return the color as a HEX string", closure: {
                    let color = UIColor(red: 0.0, green: 0.12, blue: 0.34, alpha: 1.0)

                    expect(color.argbHEXString).to(equal("#FF001E56"))
                })

                it("should return the color as a HEX string", closure: {
                    let color = UIColor(red: 0.12, green: 0.34, blue: 0.56, alpha: 0.0)

                    expect(color.argbHEXString).to(equal("#001E568E"))
                })

                it("should return the color as a HEX string", closure: {
                    let color = UIColor(red: 0.0, green: 0.12, blue: 1.0, alpha: 0.34)

                    expect(color.argbHEXString).to(equal("#56001EFF"))
                })
            })

            describe(".rgbaHEXString", {
                it("should return the color as a HEX string", closure: {
                    let color = UIColor(red: 0.0, green: 0.12, blue: 0.34, alpha: 1.0)

                    expect(color.rgbaHEXString).to(equal("#001E56FF"))
                })

                it("should return the color as a HEX string", closure: {
                    let color = UIColor(red: 0.12, green: 0.34, blue: 0.56, alpha: 0.0)

                    expect(color.rgbaHEXString).to(equal("#1E568E00"))
                })

                it("should return the color as a HEX string", closure: {
                    let color = UIColor(red: 0.0, green: 0.12, blue: 1.0, alpha: 0.34)

                    expect(color.rgbaHEXString).to(equal("#001EFF56"))
                })
            })

            describe(".argbHEX", {
                it("should return the color as a HEX number", closure: {
                    let color = UIColor(red: 0.0, green: 0.12, blue: 0.34, alpha: 1.0)

                    expect(color.argbHEX).to(equal(0xFF001E56))
                })

                it("should return the color as a HEX number", closure: {
                    let color = UIColor(red: 0.12, green: 0.34, blue: 0.56, alpha: 0.0)

                    expect(color.argbHEX).to(equal(0x001E568E))
                })

                it("should return the color as a HEX number", closure: {
                    let color = UIColor(red: 0.0, green: 0.12, blue: 1.0, alpha: 0.34)

                    expect(color.argbHEX).to(equal(0x56001EFF))
                })
            })

            describe(".rgbaHEX", {
                it("should return the color as a HEX number", closure: {
                    let color = UIColor(red: 0.0, green: 0.12, blue: 0.34, alpha: 1.0)

                    expect(color.rgbaHEX).to(equal(0x001E56FF))
                })

                it("should return the color as a HEX number", closure: {
                    let color = UIColor(red: 0.12, green: 0.34, blue: 0.56, alpha: 0.0)

                    expect(color.rgbaHEX).to(equal(0x1E568E00))
                })

                it("should return the color as a HEX number", closure: {
                    let color = UIColor(red: 0.0, green: 0.12, blue: 1.0, alpha: 0.34)

                    expect(color.rgbaHEX).to(equal(0x001EFF56))
                })
            })
        })
    }
}
