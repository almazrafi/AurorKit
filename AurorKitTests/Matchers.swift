//
//  Matchers.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 13/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

import Quick
import Nimble

func equalColor(_ expectedColor: UIColor?) -> Predicate<UIColor> {
    return Predicate.define("equal color <\(stringify(expectedColor))>") { actualExpression, message in
        let color = try actualExpression.evaluate()

        switch (expectedColor, color) {
        case (nil, _?):
            return PredicateResult(status: .fail, message: message.appendedBeNilHint())

        case (nil, nil), (_, nil):
            return PredicateResult(status: .fail, message: message)

        case let (expectedColor?, color?):
            var red: CGFloat = 0
            var green: CGFloat = 0
            var blue: CGFloat = 0
            var alpha: CGFloat = 0

            color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)

            var expectedRed: CGFloat = 0
            var expectedGreen: CGFloat = 0
            var expectedBlue: CGFloat = 0
            var expectedAlpha: CGFloat = 0

            expectedColor.getRed(&expectedRed, green: &expectedGreen, blue: &expectedBlue, alpha: &expectedAlpha)

            guard Int(red * 255.0) == Int(expectedRed * 255.0) else {
                return PredicateResult(bool: false, message: message)
            }

            guard Int(green * 255.0) == Int(expectedGreen * 255.0) else {
                return PredicateResult(bool: false, message: message)
            }

            guard Int(blue * 255.0) == Int(expectedBlue * 255.0) else {
                return PredicateResult(bool: false, message: message)
            }

            guard Int(alpha * 255.0) == Int(expectedAlpha * 255.0) else {
                return PredicateResult(bool: false, message: message)
            }

            return PredicateResult(bool: true, message: message)
        }
    }
}
