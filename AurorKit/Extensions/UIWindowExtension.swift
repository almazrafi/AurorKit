//
//  UIWindowExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 31/03/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import UIKit

extension UIWindow {

    // MARK: - Instance Properties

    public final var topViewController: UIViewController? {
        guard let rootViewController = self.rootViewController else {
            return nil
        }

        var topViewController = rootViewController

        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }

        return topViewController
    }
}
