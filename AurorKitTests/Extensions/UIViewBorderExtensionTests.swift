//
//  UIViewBorderExtensionTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 13/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIViewBorderExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var view: UIView!

        beforeEach {
            view = UIView()
        }

        describe(".border") {
            it("should return an empty border") {
                expect(view.border.width).to(equal(UIView.Border.empty.width))
                expect(view.border.color).to(equalColor(UIView.Border.empty.color))
            }

            it("should return the correct border") {
                expect(view.border.width).to(equal(view.layer.borderWidth))
                expect(view.border.color?.cgColor).to(equal(view.layer.borderColor))
            }

            it("should set border properly") {
                view.border = UIView.Border(width: 1.23, color: UIColor(red: 0.12, green: 0.34, blue: 0.56))

                expect(view.layer.borderWidth).to(equal(1.23))
                expect(view.layer.borderColor).to(equal(UIColor(red: 0.12, green: 0.34, blue: 0.56).cgColor))
            }

            it("should set border properly") {
                view.border = UIView.Border(width: 0.0, color: nil)

                expect(view.layer.borderWidth).to(equal(0.0))
                expect(view.layer.borderColor).to(beNil())
            }
        }
    }
}
