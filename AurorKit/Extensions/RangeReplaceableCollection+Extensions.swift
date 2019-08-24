import Foundation

extension RangeReplaceableCollection {

    // MARK: - Instance Methods

    @discardableResult
    public mutating func removeFirst(where predicate: ((Element) throws -> Bool)) rethrows -> Element? {
        return try firstIndex(where: predicate).map { remove(at: $0) }
    }

    public mutating func prepend<T>(contentsOf collection: T) where T: Collection, Element == T.Element {
        insert(contentsOf: collection, at: startIndex)
    }

    public mutating func prepend(_ element: Element) {
        insert(element, at: startIndex)
    }

    public func prepending<T>(contentsOf collection: T) -> Self where T: Collection, Element == T.Element {
        return collection + self
    }

    public func prepending(_ element: Element) -> Self {
        return prepending(contentsOf: [element])
    }

    public func appending<T>(contentsOf collection: T) -> Self where T: Collection, Element == T.Element {
        return self + collection
    }

    public func appending(_ element: Element) -> Self {
        return appending(contentsOf: [element])
    }
}
