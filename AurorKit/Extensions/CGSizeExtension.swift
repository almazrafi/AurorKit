//
//  CGSizeExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 01/01/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGSize {

    // MARK: - Instance Properties

    public var adjusted: CGSize {
        return CGSize(width: self.width.rounded(.awayFromZero),
                      height: self.height.rounded(.awayFromZero))
    }

    // MARK: - Initializers

    public init(equilateral side: CGFloat) {
        self.init(width: side, height: side)
    }

    public init(equilateral side: Double) {
        self.init(width: side, height: side)
    }

    public init(equilateral side: Int) {
        self.init(width: side, height: side)
    }
}
