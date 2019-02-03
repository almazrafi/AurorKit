//
//  RangeReplaceableCollectionExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 19/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

extension RangeReplaceableCollection {

    // MARK: - Instance Methods

    @discardableResult
    public mutating func removeFirst(where predicate: ((Element) throws -> Bool)) rethrows -> Element? {
        return try self.index(where: predicate).map({ self.remove(at: $0) })
    }

    public mutating func prepend<S>(contentsOf collection: S) where S: Collection, Self.Element == S.Element {
        self.insert(contentsOf: collection, at: self.startIndex)
    }

    public mutating func prepend(_ element: Element) {
        self.insert(element, at: self.startIndex)
    }
}
