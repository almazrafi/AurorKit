//
//  ArrayExtension.swift
//  AurorKit/Extensions
//
//  Created by Almaz Ibragimov on 01/01/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import Foundation

public extension Array {
    
    // MARK: - Instance Methods
    
    @discardableResult
    public mutating func removeLast(where predicate: ((Element) throws -> Bool)) rethrows -> Element? {
        return try self.lastIndex(where: predicate).map({ self.remove(at: $0) })
    }
}
