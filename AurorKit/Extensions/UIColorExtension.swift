//
//  UIColorExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 01/01/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import UIKit

public extension UIColor {

    // MARK: - Initializers

    public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }

    public convenience init(white: CGFloat) {
        self.init(white: white, alpha: 1.0)
    }

    public convenience init(redByte: UInt8, greenByte: UInt8, blueByte: UInt8, alphaByte: UInt8) {
        self.init(red: CGFloat(redByte) / 255.0,
                  green: CGFloat(greenByte) / 255.0,
                  blue: CGFloat(blueByte) / 255.0,
                  alpha: CGFloat(alphaByte) / 255.0)
    }

    public convenience init(redByte: UInt8, greenByte: UInt8, blueByte: UInt8, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(redByte) / 255.0,
                  green: CGFloat(greenByte) / 255.0,
                  blue: CGFloat(blueByte) / 255.0,
                  alpha: alpha)
    }

    public convenience init(whiteByte: UInt8, alphaByte: UInt8) {
        self.init(white: CGFloat(whiteByte) / 255.0, alpha: CGFloat(alphaByte) / 255.0)
    }

    public convenience init(whiteByte: UInt8, alpha: CGFloat = 1.0) {
        self.init(white: CGFloat(whiteByte) / 255.0, alpha: alpha)
    }

    public convenience init(argbHEX: UInt32) {
        self.init(redByte: UInt8((argbHEX >> 16) & 255),
                  greenByte: UInt8((argbHEX >> 8) & 255),
                  blueByte: UInt8(argbHEX & 255),
                  alphaByte: UInt8((argbHEX >> 24) & 255))
    }

    public convenience init(rgbHEX: UInt32) {
        self.init(redByte: UInt8((rgbHEX >> 16) & 255),
                  greenByte: UInt8((rgbHEX >> 8) & 255),
                  blueByte: UInt8(rgbHEX & 255))
    }

    // MARK: - Instance Properties

    public var argbHEXString: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return "#00000000"
        }

        if alpha < 1.0 - CGFloat.leastNonzeroMagnitude {
            return String(format: "#%02lX%02lX%02lX%02lX",
                          Int(alpha * 255.0),
                          Int(red * 255.0),
                          Int(green * 255.0),
                          Int(blue * 255.0))
        } else {
            return String(format: "#FF%02lX%02lX%02lX",
                          Int(red * 255.0),
                          Int(green * 255.0),
                          Int(blue * 255.0))
        }
    }

    public var rgbaHEXString: String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return "#00000000"
        }

        if alpha < 1.0 - CGFloat.leastNonzeroMagnitude {
            return String(format: "#%02lX%02lX%02lX%02lX",
                          Int(red * 255.0),
                          Int(green * 255.0),
                          Int(blue * 255.0),
                          Int(alpha * 255.0))
        } else {
            return String(format: "#%02lX%02lX%02lXFF",
                          Int(red * 255.0),
                          Int(green * 255.0),
                          Int(blue * 255.0))
        }
    }

    public var argbHEX: UInt32 {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return 0
        }

        let alphaByte: UInt32

        if alpha < 1.0 - CGFloat.leastNonzeroMagnitude {
            alphaByte = UInt32(alpha * 255.0) << 24
        } else {
            alphaByte = UInt32(255) << 24
        }

        let redByte = UInt32(red * 255.0) << 16
        let greenByte = UInt32(green * 255.0) << 8
        let blueByte = UInt32(blue * 255.0)

        return alphaByte | redByte | greenByte | blueByte
    }

    public var rgbaHEX: UInt32 {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return 0
        }

        let redByte = UInt32(red * 255.0) << 24
        let greenByte = UInt32(green * 255.0) << 16
        let blueByte = UInt32(blue * 255.0) << 8

        let alphaByte: UInt32

        if alpha < 1.0 - CGFloat.leastNonzeroMagnitude {
            alphaByte = UInt32(alpha * 255.0)
        } else {
            alphaByte = UInt32(255)
        }

        return redByte | greenByte | blueByte | alphaByte
    }
}
