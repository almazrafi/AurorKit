//
//  UIViewControllerExtensionTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 13/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIViewControllerExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var window: UIWindow!
        var viewController: UIViewController!

        beforeEach {
            window = UIWindow(frame: UIScreen.main.bounds)
            viewController = UIViewController()
        }

        describe(".isVisible") {
            context("when window has no root view controller") {
                it("should be invisible") {
                    expect(viewController.isVisible).to(beFalse())
                }
            }

            context("when window has root view controller") {
                beforeEach {
                    window.rootViewController = viewController

                    viewController.loadViewIfNeeded()
                }

                it("should return invisible") {
                    expect(viewController.isVisible).toEventuallyNot(beTrue())
                }

                context("when window is visible") {
                    beforeEach {
                        window.isHidden = false
                    }

                    it("should be invisible") {
                        expect(viewController.isVisible).toEventuallyNot(beFalse())
                    }
                }
            }
        }
    }
}
