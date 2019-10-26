#if canImport(CoreGraphics)
import CoreGraphics
import Nimble

func beCloseTo(_ expectedValue: CGPoint, within delta: CGFloat = CGFloat(DefaultDelta)) -> Predicate<CGPoint> {
    let message = "be close to <\(stringify(expectedValue))> (each within \(stringify(delta)))"

    return Predicate.simple(message) { actualExpression in
        guard let value = try actualExpression.evaluate() else {
            return .doesNotMatch
        }

        guard abs(value.x - expectedValue.x) < delta else {
            return .doesNotMatch
        }

        guard abs(value.y - expectedValue.y) < delta else {
            return .doesNotMatch
        }

        return .matches
    }
}
#endif
