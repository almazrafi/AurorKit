//
//  FloatingPointExtension.swift
//  AurorKit/Extensions
//
//  Created by Almaz Ibragimov on 18/04/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import Foundation

public extension FloatingPoint {
    
    // MARK: - Instance Properties
    
    public var degreesToRadians: Self {
        return self * .pi / 180
    }
    
    public var radiansToDegrees: Self {
        return self * 180 / .pi
    }
}
