import Foundation

extension Array {

    // MARK: - Instance Methods

    @discardableResult
    public mutating func removeLast(where predicate: ((Element) throws -> Bool)) rethrows -> Element? {
        return try lastIndex(where: predicate).map { remove(at: $0) }
    }
}
