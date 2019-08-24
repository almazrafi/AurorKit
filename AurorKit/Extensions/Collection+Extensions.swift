import Foundation

extension Collection {

    // MARK: - Intance Methods

    public func contains(index: Index) -> Bool {
        return ((index >= startIndex) && (index < endIndex))
    }

    public func split(maxSplits: Int, by separator: (Element, Element) throws -> Bool) rethrows -> [SubSequence] {
        var subSequences: [SubSequence] = []
        var firstElementIndex = startIndex

        while (firstElementIndex < endIndex) && (subSequences.count < maxSplits) {
            let firstElement = self[firstElementIndex]
            var nextElementIndex = index(after: firstElementIndex)

            while nextElementIndex < endIndex {
                let nextElement = self[nextElementIndex]

                if try separator(firstElement, nextElement) {
                    break
                }

                nextElementIndex = index(after: nextElementIndex)
            }

            subSequences.append(self[firstElementIndex..<nextElementIndex])

            firstElementIndex = nextElementIndex
        }

        if firstElementIndex < endIndex {
            subSequences.append(self[firstElementIndex..<endIndex])
        }

        return subSequences
    }

    public func split(by separator: (Element, Element) throws -> Bool) rethrows -> [SubSequence] {
        return try split(maxSplits: count, by: separator)
    }

    // MARK: - Instance Subscripts

    public subscript(safe index: Index) -> Element? {
        return contains(index: index) ? self[index] : nil
    }
}

// MARK: - where Element: Hashable

extension Collection where Element: Hashable {

    // MARK: - Instance Methods

    public func unique() -> [Element] {
        var elements = Set(self)

        return filter { element in
            elements.remove(element) != nil
        }
    }
}
