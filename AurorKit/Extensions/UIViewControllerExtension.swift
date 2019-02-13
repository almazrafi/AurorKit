//
//  UIViewControllerExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 11/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

extension UIViewController {

    // MARK: - Instance Properties

    public var isVisible: Bool {
        return viewIfLoaded?.window != nil
    }
}
