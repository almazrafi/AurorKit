#if canImport(CoreGraphics)
import CoreGraphics
import Nimble

extension CGColor {

    // MARK: - Instance Methods

    func isEquivalent(to otherColor: CGColor) -> Bool {
        guard let colorSpace = self.colorSpace else {
            return self == otherColor
        }

        return self == otherColor.converted(
            to: colorSpace,
            intent: .defaultIntent,
            options: nil
        )
    }
}

func beEquivalentTo(_ expectedColor: CGColor?) -> Predicate<CGColor> {
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
#endif
