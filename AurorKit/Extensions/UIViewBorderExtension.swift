//
//  UIViewBorderExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 11/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

extension UIView {

    // MARK: - Nested Types

    public struct Border: Equatable {

        // MARK: - Type Properties

        public static let empty = Border()

        // MARK: - Instance Properties

        public let width: CGFloat
        public let color: UIColor?

        // MARK: - Initializers

        public init(width: CGFloat = 0.0, color: UIColor? = .black) {
            self.width = width
            self.color = color
        }
    }

    // MARK: - Instance Properties

    public var border: Border {
        get {
            return Border(width: self.layer.borderWidth,
                          color: self.layer.borderColor.map({ UIColor(cgColor: $0) }))
        }

        set {
            self.layer.borderWidth = newValue.width
            self.layer.borderColor = newValue.color?.cgColor
        }
    }
}
