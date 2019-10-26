#if canImport(UIKit)
import UIKit

extension UIColor {

    // MARK: - Instance Properties

    public var argbHexString: String {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return String(
            format: "#%02lX%02lX%02lX%02lX",
            Int(alpha * 255.0),
            Int(red * 255.0),
            Int(green * 255.0),
            Int(blue * 255.0)
        )
    }

    public var rgbaHexString: String {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return String(
            format: "#%02lX%02lX%02lX%02lX",
            Int(red * 255.0),
            Int(green * 255.0),
            Int(blue * 255.0),
            Int(alpha * 255.0)
        )
    }

    public var rgbHexString: String {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return String(
            format: "#%02lX%02lX%02lX",
            Int(red * 255.0),
            Int(green * 255.0),
            Int(blue * 255.0)
        )
    }

    public var argbHex: UInt32 {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

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

    public var rgbaHex: UInt32 {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

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

    public var rgbHex: UInt32 {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let redByte = UInt32(red * 255.0) << 16
        let greenByte = UInt32(green * 255.0) << 8
        let blueByte = UInt32(blue * 255.0)

        return redByte | greenByte | blueByte
    }

    // MARK: - Initializers

    public convenience init(red: CGFloat, green: CGFloat, blue: CGFloat) {
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }

    public convenience init(white: CGFloat) {
        self.init(white: white, alpha: 1.0)
    }

    public convenience init(redByte: UInt8, greenByte: UInt8, blueByte: UInt8, alphaByte: UInt8) {
        self.init(
            red: CGFloat(redByte) / 255.0,
            green: CGFloat(greenByte) / 255.0,
            blue: CGFloat(blueByte) / 255.0,
            alpha: CGFloat(alphaByte) / 255.0
        )
    }

    public convenience init(redByte: UInt8, greenByte: UInt8, blueByte: UInt8, alpha: CGFloat = 1.0) {
        self.init(
            red: CGFloat(redByte) / 255.0,
            green: CGFloat(greenByte) / 255.0,
            blue: CGFloat(blueByte) / 255.0,
            alpha: alpha
        )
    }

    public convenience init(whiteByte: UInt8, alphaByte: UInt8) {
        self.init(white: CGFloat(whiteByte) / 255.0, alpha: CGFloat(alphaByte) / 255.0)
    }

    public convenience init(whiteByte: UInt8, alpha: CGFloat = 1.0) {
        self.init(white: CGFloat(whiteByte) / 255.0, alpha: alpha)
    }

    public convenience init?(argbHexString hexString: String) {
        guard hexString.hasPrefix("#") else {
            return nil
        }

        let scanner = Scanner(string: hexString)

        scanner.scanLocation = 1
        scanner.caseSensitive = false

        var hex: UInt32 = 0

        guard scanner.scanHexInt32(&hex) else {
            return nil
        }

        self.init(argbHex: hex)
    }

    public convenience init?(rgbaHexString hexString: String) {
        guard hexString.hasPrefix("#") else {
            return nil
        }

        let scanner = Scanner(string: hexString)

        scanner.scanLocation = 1
        scanner.caseSensitive = false

        var hex: UInt32 = 0

        guard scanner.scanHexInt32(&hex) else {
            return nil
        }

        self.init(rgbaHex: hex)
    }

    public convenience init?(rgbHexString hexString: String) {
        guard hexString.hasPrefix("#") else {
            return nil
        }

        let scanner = Scanner(string: hexString)

        scanner.scanLocation = 1
        scanner.caseSensitive = false

        var hex: UInt32 = 0

        guard scanner.scanHexInt32(&hex) else {
            return nil
        }

        self.init(rgbHex: hex)
    }

    public convenience init(argbHex hex: UInt32) {
        self.init(
            redByte: UInt8((hex >> 16) & 255),
            greenByte: UInt8((hex >> 8) & 255),
            blueByte: UInt8(hex & 255),
            alphaByte: UInt8((hex >> 24) & 255)
        )
    }

    public convenience init(rgbaHex hex: UInt32) {
        self.init(
            redByte: UInt8((hex >> 24) & 255),
            greenByte: UInt8((hex >> 16) & 255),
            blueByte: UInt8((hex >> 8) & 255),
            alphaByte: UInt8(hex & 255)
        )
    }

    public convenience init(rgbHex hex: UInt32) {
        self.init(
            redByte: UInt8((hex >> 16) & 255),
            greenByte: UInt8((hex >> 8) & 255),
            blueByte: UInt8(hex & 255)
        )
    }
}
#endif
