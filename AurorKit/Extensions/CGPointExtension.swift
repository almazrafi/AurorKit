//
//  CGPointExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 01/01/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGPoint {

    // MARK: - Instance Properties

    public var adjusted: CGPoint {
        return CGPoint(x: self.x.rounded(.down),
                       y: self.y.rounded(.down))
    }
}
