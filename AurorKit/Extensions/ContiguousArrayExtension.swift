//
//  ContiguousArrayExtension.swift
//  AurorKit/Extensions
//
//  Created by Almaz Ibragimov on 19/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

public extension ContiguousArray {
    
    // MARK: - Instance Methods
    
    @discardableResult
    public mutating func removeLast(where predicate: ((Element) throws -> Bool)) rethrows -> Element? {
        return try self.lastIndex(where: predicate).map({ self.remove(at: $0) })
    }
}
