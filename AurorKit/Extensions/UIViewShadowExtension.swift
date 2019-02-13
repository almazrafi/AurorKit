//
//  UIViewShadowExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 11/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

extension UIView {

    // MARK: - Nested Types

    public struct Shadow: Equatable {

        // MARK: - Type Properties

        public static let empty = Shadow()

        // MARK: - Instance Properties

        public let offset: CGSize
        public let radius: CGFloat
        public let color: UIColor?
        public let opacity: Float
        public let shouldRasterize: Bool

        // MARK: - Initializers

        public init(offset: CGSize = CGSize(width: 0, height: -3),
                    radius: CGFloat = 3.0,
                    color: UIColor? = .black,
                    opacity: Float = 0.0,
                    shouldRasterize: Bool = false) {
            self.offset = offset
            self.radius = radius
            self.color = color
            self.opacity = opacity
            self.shouldRasterize = shouldRasterize
        }
    }

    // MARK: - Instance Properties

    public var shadow: Shadow {
        get {
            return Shadow(offset: self.layer.shadowOffset,
                          radius: self.layer.shadowRadius,
                          color: self.layer.shadowColor.map({ UIColor(cgColor: $0) }),
                          opacity: self.layer.shadowOpacity,
                          shouldRasterize: self.layer.shouldRasterize)
        }

        set {
            self.layer.shadowOffset = newValue.offset
            self.layer.shadowRadius = newValue.radius
            self.layer.shadowColor = newValue.color?.cgColor
            self.layer.shadowOpacity = newValue.opacity
            self.layer.shouldRasterize = newValue.shouldRasterize
        }
    }
}
