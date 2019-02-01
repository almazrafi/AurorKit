//
//  CGRectExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 01/01/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGRect {

    // MARK: - Instance Properties

    public var top: CGFloat {
        return min(self.origin.y, self.origin.y + self.size.height)
    }

    public var left: CGFloat {
        return min(self.origin.x, self.origin.x + self.size.width)
    }

    public var bottom: CGFloat {
        return max(self.origin.y, self.origin.y + self.size.height)
    }

    public var right: CGFloat {
        return max(self.origin.x, self.origin.x + self.size.width)
    }

    // MARK: -

    public var adjusted: CGRect {
        return CGRect(x: self.left.rounded(.down),
                      y: self.top.rounded(.down),
                      width: abs(self.width.rounded(.awayFromZero)),
                      height: abs(self.height.rounded(.awayFromZero)))
    }

    // MARK: - Initializers

    public init(x: CGFloat, y: CGFloat, size: CGSize) {
        self.init(x: x, y: y, width: size.width, height: size.height)
    }

    public init(x: Double, y: Double, size: CGSize) {
        self.init(x: CGFloat(x), y: CGFloat(y), width: size.width, height: size.height)
    }

    public init(x: Int, y: Int, size: CGSize) {
        self.init(x: CGFloat(x), y: CGFloat(y), width: size.width, height: size.height)
    }

    public init(origin: CGPoint, width: CGFloat, height: CGFloat) {
        self.init(x: origin.x, y: origin.y, width: width, height: height)
    }

    public init(origin: CGPoint, width: Double, height: Double) {
        self.init(x: origin.x, y: origin.y, width: CGFloat(width), height: CGFloat(height))
    }

    public init(origin: CGPoint, width: Int, height: Int) {
        self.init(x: origin.x, y: origin.y, width: CGFloat(width), height: CGFloat(height))
    }
}
