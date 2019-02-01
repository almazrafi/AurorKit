//
//  NSLayoutConstraintExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 20/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

public extension NSLayoutConstraint {

    // MARK: - Instance Properties

    @IBInspectable public final var preciseConstant: Int {
        get {
            return Int(self.constant * UIScreen.main.scale)
        }

        set {
            self.constant = CGFloat(newValue) / UIScreen.main.scale
        }
    }
}
