#if canImport(CoreGraphics)
import CoreGraphics
import Nimble

func beCloseTo(_ expectedValue: CGRect, within delta: CGFloat = CGFloat(DefaultDelta)) -> Predicate<CGRect> {
    let message = "be close to <\(stringify(expectedValue))> (each within \(stringify(delta)))"

    return Predicate.simple(message) { actualExpression in
        guard let value = try actualExpression.evaluate() else {
            return .doesNotMatch
        }

        guard abs(value.minX - expectedValue.minX) < delta else {
            return .doesNotMatch
        }

        guard abs(value.minY - expectedValue.minY) < delta else {
            return .doesNotMatch
        }

        guard abs(value.maxX - expectedValue.maxX) < delta else {
            return .doesNotMatch
        }

        guard abs(value.maxY - expectedValue.maxY) < delta else {
            return .doesNotMatch
        }

        return .matches
    }
}
#endif
