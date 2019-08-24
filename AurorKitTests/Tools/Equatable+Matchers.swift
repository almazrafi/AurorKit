import Foundation
import Nimble

func beEquivalentTo<T: Equatable>(_ expectedValue: T?) -> Predicate<T> {
    return Predicate.defineNilable("be equivalent to <\(stringify(expectedValue))>") { actualExpression, message in
        let value = try actualExpression.evaluate()

        switch (expectedValue, value) {
        case (nil, nil):
            return PredicateResult(bool: true, message: message)

        case (nil, _?):
            return PredicateResult(bool: false, message: message.appendedBeNilHint())

        case (_?, nil):
            return PredicateResult(bool: false, message: message)

        case let (expectedValue?, value?):
            return PredicateResult(bool: expectedValue == value, message: message)
        }
    }
}
