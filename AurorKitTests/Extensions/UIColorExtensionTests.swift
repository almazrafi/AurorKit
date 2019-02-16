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
        describe(".init(red:, green:, blue:)") {
            it("should initialize properly") {
                let color = UIColor(red: 0.0, green: 0.123, blue: 1.0)

                expect(color).to(equal(UIColor(red: 0.0, green: 0.123, blue: 1.0, alpha: 1.0)))
            }
        }

        describe(".init(white:)") {
            it("should initialize properly") {
                let color = UIColor(white: 0.0)

                expect(color).to(equal(UIColor(white: 0.0, alpha: 1.0)))
            }

            it("should initialize properly") {
                let color = UIColor(white: 0.123)

                expect(color).to(equal(UIColor(white: 0.123, alpha: 1.0)))
            }

            it("should initialize properly") {
                let color = UIColor(white: 1.0)

                expect(color).to(equal(UIColor(white: 1.0, alpha: 1.0)))
            }
        }

        describe(".init(redByte:, greenByte:, blueByte:, alphaByte:)") {
            it("should initialize properly") {
                let color = UIColor(redByte: 0, greenByte: 123, blueByte: 255, alphaByte: 255)

                expect(color).to(equal(UIColor(red: 0.0, green: 123.0 / 255.0, blue: 1.0, alpha: 1.0)))
            }
        }

        describe(".init(redByte:, greenByte:, blueByte:, alpha:)") {
            it("should initialize properly") {
                let color = UIColor(redByte: 0, greenByte: 123, blueByte: 255, alpha: 0.123)

                expect(color).to(equal(UIColor(red: 0.0, green: 123.0 / 255.0, blue: 1.0, alpha: 0.123)))
            }

            it("should initialize properly") {
                let color = UIColor(redByte: 0, greenByte: 123, blueByte: 255)

                expect(color).to(equal(UIColor(red: 0.0, green: 123.0 / 255.0, blue: 1.0, alpha: 1.0)))
            }
        }

        describe(".init(whiteByte:, alphaByte:)") {
            it("should initialize properly") {
                let color = UIColor(whiteByte: 0, alphaByte: 0)

                expect(color).to(equal(UIColor(white: 0.0, alpha: 0.0)))
            }

            it("should initialize properly") {
                let color = UIColor(whiteByte: 123, alphaByte: 123)

                expect(color).to(equal(UIColor(white: 123.0 / 255.0, alpha: 123.0 / 255.0)))
            }

            it("should initialize properly") {
                let color = UIColor(whiteByte: 255, alphaByte: 255)

                expect(color).to(equal(UIColor(white: 1.0, alpha: 1.0)))
            }
        }

        describe(".init(whiteByte:, alpha:)") {
            it("should initialize properly") {
                let color = UIColor(whiteByte: 0, alpha: 0.0)

                expect(color).to(equal(UIColor(white: 0.0, alpha: 0.0)))
            }

            it("should initialize properly") {
                let color = UIColor(whiteByte: 123, alpha: 0.123)

                expect(color).to(equal(UIColor(white: 123.0 / 255.0, alpha: 0.123)))
            }

            it("should initialize properly") {
                let color = UIColor(whiteByte: 255, alpha: 1.0)

                expect(color).to(equal(UIColor(white: 1.0, alpha: 1.0)))
            }
        }

        describe(".init(argbHexString:)") {
            it("should initialize properly") {
                let color = UIColor(argbHexString: "#12345678")

                expect(color).to(equal(UIColor(red: 52.0 / 255.0,
                                               green: 86.0 / 255.0,
                                               blue: 120.0 / 255.0,
                                               alpha: 18.0 / 255.0)))
            }

            it("should initialize properly") {
                let color = UIColor(argbHexString: "#1234")

                expect(color).to(equal(UIColor(red: 0.0,
                                               green: 18.0 / 255.0,
                                               blue: 52.0 / 255.0,
                                               alpha: 0.0)))
            }

            it("should not initialize with invalid hex string") {
                let color = UIColor(argbHexString: "%12345678")

                expect(color).to(beNil())
            }

            it("should not initialize with invalid hex string") {
                let color = UIColor(argbHexString: "#qwerty")

                expect(color).to(beNil())
            }
        }

        describe(".init(rgbaHexString:)") {
            it("should initialize properly") {
                let color = UIColor(rgbaHexString: "#12345678")

                expect(color).to(equal(UIColor(red: 18.0 / 255.0,
                                               green: 52.0 / 255.0,
                                               blue: 86.0 / 255.0,
                                               alpha: 120.0 / 255.0)))
            }

            it("should initialize properly") {
                let color = UIColor(rgbaHexString: "#1234")

                expect(color).to(equal(UIColor(red: 0.0,
                                               green: 0.0,
                                               blue: 18.0 / 255.0,
                                               alpha: 52.0 / 255.0)))
            }

            it("should not initialize with invalid Hex string") {
                let color = UIColor(rgbaHexString: "%12345678")

                expect(color).to(beNil())
            }

            it("should not initialize with invalid Hex string") {
                let color = UIColor(rgbaHexString: "#qwerty")

                expect(color).to(beNil())
            }
        }

        describe(".init(rgbHexString:)") {
            it("should initialize properly") {
                let color = UIColor(rgbHexString: "#12345678")

                expect(color).to(equal(UIColor(red: 52.0 / 255.0,
                                               green: 86.0 / 255.0,
                                               blue: 120.0 / 255.0,
                                               alpha: 1.0)))
            }

            it("should initialize properly") {
                let color = UIColor(rgbHexString: "#123456")

                expect(color).to(equal(UIColor(red: 18.0 / 255.0,
                                               green: 52.0 / 255.0,
                                               blue: 86.0 / 255.0,
                                               alpha: 1.0)))
            }

            it("should initialize properly") {
                let color = UIColor(rgbHexString: "#1234")

                expect(color).to(equal(UIColor(red: 0.0,
                                               green: 18.0 / 255.0,
                                               blue: 52.0 / 255.0,
                                               alpha: 1.0)))
            }

            it("should not initialize with invalid Hex string") {
                let color = UIColor(rgbHexString: "%12345678")

                expect(color).to(beNil())
            }

            it("should not initialize with invalid Hex string") {
                let color = UIColor(rgbHexString: "#qwerty")

                expect(color).to(beNil())
            }
        }

        describe(".init(argbHex:)") {
            it("should initialize properly") {
                let color = UIColor(argbHex: 0x12345678)

                expect(color).to(equal(UIColor(red: 52.0 / 255.0,
                                               green: 86.0 / 255.0,
                                               blue: 120.0 / 255.0,
                                               alpha: 18.0 / 255.0)))
            }

            it("should initialize properly") {
                let color = UIColor(argbHex: 0x1234)

                expect(color).to(equal(UIColor(red: 0.0,
                                               green: 18.0 / 255.0,
                                               blue: 52.0 / 255.0,
                                               alpha: 0.0)))
            }
        }

        describe(".init(rgbaHex:)") {
            it("should initialize properly") {
                let color = UIColor(rgbaHex: 0x12345678)

                expect(color).to(equal(UIColor(red: 18.0 / 255.0,
                                               green: 52.0 / 255.0,
                                               blue: 86.0 / 255.0,
                                               alpha: 120.0 / 255.0)))
            }

            it("should initialize properly") {
                let color = UIColor(rgbaHex: 0x1234)

                expect(color).to(equal(UIColor(red: 0.0,
                                               green: 0.0,
                                               blue: 18.0 / 255.0,
                                               alpha: 52.0 / 255.0)))
            }
        }

        describe(".init(rgbHex:)") {
            it("should initialize properly") {
                let color = UIColor(rgbHex: 0x12345678)

                expect(color).to(equal(UIColor(red: 52.0 / 255.0,
                                               green: 86.0 / 255.0,
                                               blue: 120.0 / 255.0,
                                               alpha: 1.0)))
            }

            it("should initialize properly") {
                let color = UIColor(rgbHex: 0x123456)

                expect(color).to(equal(UIColor(red: 18.0 / 255.0,
                                               green: 52.0 / 255.0,
                                               blue: 86.0 / 255.0,
                                               alpha: 1.0)))
            }

            it("should initialize properly") {
                let color = UIColor(rgbHex: 0x1234)

                expect(color).to(equal(UIColor(red: 0.0,
                                               green: 18.0 / 255.0,
                                               blue: 52.0 / 255.0,
                                               alpha: 1.0)))
            }
        }

        describe(".argbHexString") {
            it("should return the color as hex string") {
                let color = UIColor(red: 0.0, green: 0.12, blue: 0.34, alpha: 1.0)

                expect(color.argbHexString).to(equal("#FF001E56"))
            }

            it("should return the color as hex string") {
                let color = UIColor(red: 0.12, green: 0.34, blue: 0.56, alpha: 0.0)

                expect(color.argbHexString).to(equal("#001E568E"))
            }

            it("should return the color as hex string") {
                let color = UIColor(red: 0.0, green: 0.12, blue: 1.0, alpha: 0.34)

                expect(color.argbHexString).to(equal("#56001EFF"))
            }
        }

        describe(".rgbaHexString") {
            it("should return the color as hex string") {
                let color = UIColor(red: 0.0, green: 0.12, blue: 0.34, alpha: 1.0)

                expect(color.rgbaHexString).to(equal("#001E56FF"))
            }

            it("should return the color as hex string") {
                let color = UIColor(red: 0.12, green: 0.34, blue: 0.56, alpha: 0.0)

                expect(color.rgbaHexString).to(equal("#1E568E00"))
            }

            it("should return the color as hex string") {
                let color = UIColor(red: 0.0, green: 0.12, blue: 1.0, alpha: 0.34)

                expect(color.rgbaHexString).to(equal("#001EFF56"))
            }
        }

        describe(".rgbHexString") {
            it("should return the color as hex string") {
                let color = UIColor(red: 0.0, green: 0.12, blue: 0.34, alpha: 1.0)

                expect(color.rgbHexString).to(equal("#001E56"))
            }

            it("should return the color as hex string") {
                let color = UIColor(red: 0.12, green: 0.34, blue: 0.56, alpha: 0.0)

                expect(color.rgbHexString).to(equal("#1E568E"))
            }

            it("should return the color as hex string") {
                let color = UIColor(red: 0.0, green: 0.12, blue: 1.0, alpha: 0.34)

                expect(color.rgbHexString).to(equal("#001EFF"))
            }
        }

        describe(".argbHex") {
            it("should return the color as hex number") {
                let color = UIColor(red: 0.0, green: 0.12, blue: 0.34, alpha: 1.0)

                expect(color.argbHex).to(equal(0xFF001E56))
            }

            it("should return the color as hex number") {
                let color = UIColor(red: 0.12, green: 0.34, blue: 0.56, alpha: 0.0)

                expect(color.argbHex).to(equal(0x001E568E))
            }

            it("should return the color as hex number") {
                let color = UIColor(red: 0.0, green: 0.12, blue: 1.0, alpha: 0.34)

                expect(color.argbHex).to(equal(0x56001EFF))
            }
        }

        describe(".rgbaHex") {
            it("should return the color as hex number") {
                let color = UIColor(red: 0.0, green: 0.12, blue: 0.34, alpha: 1.0)

                expect(color.rgbaHex).to(equal(0x001E56FF))
            }

            it("should return the color as hex number") {
                let color = UIColor(red: 0.12, green: 0.34, blue: 0.56, alpha: 0.0)

                expect(color.rgbaHex).to(equal(0x1E568E00))
            }

            it("should return the color as hex number") {
                let color = UIColor(red: 0.0, green: 0.12, blue: 1.0, alpha: 0.34)

                expect(color.rgbaHex).to(equal(0x001EFF56))
            }
        }

        describe(".rgbHex") {
            it("should return the color as hex number") {
                let color = UIColor(red: 0.0, green: 0.12, blue: 0.34, alpha: 1.0)

                expect(color.rgbHex).to(equal(0x001E56))
            }

            it("should return the color as hex number") {
                let color = UIColor(red: 0.12, green: 0.34, blue: 0.56, alpha: 0.0)

                expect(color.rgbHex).to(equal(0x1E568E))
            }

            it("should return the color as hex number") {
                let color = UIColor(red: 0.0, green: 0.12, blue: 1.0, alpha: 0.34)

                expect(color.rgbHex).to(equal(0x001EFF))
            }
        }
    }
}
