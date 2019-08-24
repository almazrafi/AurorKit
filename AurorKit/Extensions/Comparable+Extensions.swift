import Foundation

extension Comparable {

    // MARK: - Instance Methods

    public mutating func clampBetween(lowerBound: Self, upperBound: Self) {
        self = clampedBetween(lowerBound: lowerBound, upperBound: upperBound)
    }

    public mutating func clamp(to range: ClosedRange<Self>) {
        self = clamped(to: range)
    }

    public func clampedBetween(lowerBound: Self, upperBound: Self) -> Self {
        return clamped(to: lowerBound...upperBound)
    }

    public func clamped(to range: ClosedRange<Self>) -> Self {
        return min(max(self, range.lowerBound), range.upperBound)
    }
}
