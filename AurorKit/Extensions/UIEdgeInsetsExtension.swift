//
//  UIEdgeInsetsExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 01/01/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {

    // MARK: - Initializers

    public init(equilateral side: CGFloat) {
        self.init(top: side, left: side, bottom: side, right: side)
    }
}
