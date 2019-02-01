//
//  CollectionExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 19/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

public extension Collection {

    // MARK: - Instance Subscripts

    public subscript(safe index: Index) -> Element? {
        return self.contains(index: index) ? self[index] : nil
    }

    // MARK: - Intance Methods

    public func contains(index: Index) -> Bool {
        return ((index >= self.startIndex) && (index < self.endIndex))
    }

    public func split(maxSplits: Int, by predicate: (Element, Element) throws -> Bool) rethrows -> [SubSequence] {
        var subSequences: [SubSequence] = []
        var firstElementIndex = self.startIndex

        while (firstElementIndex < self.endIndex) && (subSequences.count < maxSplits) {
            let firstElement = self[firstElementIndex]
            var nextElementIndex = self.index(after: firstElementIndex)

            while nextElementIndex < self.endIndex {
                let nextElement = self[nextElementIndex]

                if !(try predicate(firstElement, nextElement)) {
                    break
                }

                nextElementIndex = self.index(after: nextElementIndex)
            }

            subSequences.append(self[firstElementIndex..<nextElementIndex])

            firstElementIndex = nextElementIndex
        }

        if firstElementIndex < self.endIndex {
            subSequences.append(self[firstElementIndex..<self.endIndex])
        }

        return subSequences
    }

    public func split(by predicate: (Element, Element) throws -> Bool) rethrows -> [SubSequence] {
        return try self.split(maxSplits: self.count, by: predicate)
    }
}
