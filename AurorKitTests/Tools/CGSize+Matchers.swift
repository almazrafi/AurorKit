import CoreGraphics
import Nimble

func beCloseTo(_ expectedValue: CGSize, within delta: CGFloat = CGFloat(DefaultDelta)) -> Predicate<CGSize> {
    let message = "be close to <\(stringify(expectedValue))> (each within \(stringify(delta)))"

    return Predicate.simple(message) { actualExpression in
        guard let value = try actualExpression.evaluate() else {
            return .doesNotMatch
        }

        guard abs(value.width - expectedValue.width) < delta else {
            return .doesNotMatch
        }

        guard abs(value.height - expectedValue.height) < delta else {
            return .doesNotMatch
        }

        return .matches
    }
}
