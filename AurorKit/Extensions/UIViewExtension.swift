//
//  UIViewExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 07/10/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import UIKit

extension UIView {

    // MARK: - Instance Properties

    public var safeAreaLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return self.safeAreaLayoutGuide.leadingAnchor
        } else {
            return self.leadingAnchor
        }
    }

    public var safeAreaTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return self.safeAreaLayoutGuide.trailingAnchor
        } else {
            return self.trailingAnchor
        }
    }

    public var safeAreaTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }

    public var safeAreaBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }

    public var safeAreaWidthAnchor: NSLayoutDimension {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return self.safeAreaLayoutGuide.widthAnchor
        } else {
            return self.widthAnchor
        }
    }

    public var safeAreaHeightAnchor: NSLayoutDimension {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return self.safeAreaLayoutGuide.heightAnchor
        } else {
            return self.heightAnchor
        }
    }

    public var safeAreaCenterXAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return self.safeAreaLayoutGuide.centerXAnchor
        } else {
            return self.centerXAnchor
        }
    }

    public var safeAreaCenterYAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return self.safeAreaLayoutGuide.centerYAnchor
        } else {
            return self.centerYAnchor
        }
    }
}
