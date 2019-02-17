//
//  ComparableExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 11/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

extension Comparable {

    // MARK: - Instance Methods

    public mutating func clampBetween(lowerBound: Self, upperBound: Self) {
        self = self.clampedBetween(lowerBound: lowerBound, upperBound: upperBound)
    }

    public mutating func clamp(to range: ClosedRange<Self>) {
        self = self.clamped(to: range)
    }

    public func clampedBetween(lowerBound: Self, upperBound: Self) -> Self {
        return self.clamped(to: lowerBound...upperBound)
    }

    public func clamped(to range: ClosedRange<Self>) -> Self {
        return min(max(self, range.lowerBound), range.upperBound)
    }
}
