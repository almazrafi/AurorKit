import UIKit
import Nimble

extension UIColor {

    // MARK: - Instance Methods

    func isEquivalent(to otherColor: UIColor) -> Bool {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        var otherRed: CGFloat = 0.0
        var otherGreen: CGFloat = 0.0
        var otherBlue: CGFloat = 0.0
        var otherAlpha: CGFloat = 0.0

        otherColor.getRed(&otherRed, green: &otherGreen, blue: &otherBlue, alpha: &otherAlpha)

        guard Int(red * 255.0) == Int(otherRed * 255.0) else {
            return false
        }

        guard Int(green * 255.0) == Int(otherGreen * 255.0) else {
            return false
        }

        guard Int(blue * 255.0) == Int(otherBlue * 255.0) else {
            return false
        }

        guard Int(alpha * 255.0) == Int(otherAlpha * 255.0) else {
            return false
        }

        return true
    }
}

// MARK: -

func beEquivalentTo(_ expectedColor: UIColor?) -> Predicate<UIColor> {
    return Predicate.defineNilable("be equivalent to <\(stringify(expectedColor))>") { actualExpression, message in
        let color = try actualExpression.evaluate()

        switch (expectedColor, color) {
        case (nil, nil):
            return PredicateResult(bool: true, message: message)

        case (nil, _?):
            return PredicateResult(bool: false, message: message.appendedBeNilHint())

        case (_?, nil):
            return PredicateResult(bool: false, message: message)

        case let (expectedColor?, color?):
            return PredicateResult(bool: color.isEquivalent(to: expectedColor), message: message)
        }
    }
}

func beEquivalentTo(_ expectedColor: CGColor?) -> Predicate<UIColor> {
    return Predicate.defineNilable("be equivalent to <\(stringify(expectedColor))>") { actualExpression, message in
        let color = try actualExpression.evaluate()

        switch (expectedColor, color) {
        case (nil, nil):
            return PredicateResult(bool: true, message: message)

        case (nil, _?):
            return PredicateResult(bool: false, message: message.appendedBeNilHint())

        case (_?, nil):
            return PredicateResult(bool: false, message: message)

        case let (expectedColor?, color?):
            return PredicateResult(bool: color.isEquivalent(to: UIColor(cgColor: expectedColor)), message: message)
        }
    }
}

func beEquivalentTo(_ expectedColor: UIColor?) -> Predicate<CGColor> {
    return Predicate.defineNilable("be equivalent to <\(stringify(expectedColor))>") { actualExpression, message in
        let color = try actualExpression.evaluate()

        switch (expectedColor, color) {
        case (nil, nil):
            return PredicateResult(bool: true, message: message)

        case (nil, _?):
            return PredicateResult(bool: false, message: message.appendedBeNilHint())

        case (_?, nil):
            return PredicateResult(bool: false, message: message)

        case let (expectedColor?, color?):
            return PredicateResult(bool: UIColor(cgColor: color).isEquivalent(to: expectedColor), message: message)
        }
    }
}
