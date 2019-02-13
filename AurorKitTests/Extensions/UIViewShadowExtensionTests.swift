//
//  UIViewShadowExtensionTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 13/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIViewShadowExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var view: UIView!

        beforeEach {
            view = UIView()
        }

        describe(".border") {
            it("should return an empty shadow") {
                expect(view.shadow.offset).to(equal(UIView.Shadow.empty.offset))
                expect(view.shadow.radius).to(equal(UIView.Shadow.empty.radius))
                expect(view.shadow.color).to(equalColor(UIView.Shadow.empty.color))
                expect(view.shadow.opacity).to(equal(UIView.Shadow.empty.opacity))
                expect(view.shadow.shouldRasterize).to(equal(UIView.Shadow.empty.shouldRasterize))
            }

            it("should return the correct shadow") {
                expect(view.shadow.offset).to(equal(view.layer.shadowOffset))
                expect(view.shadow.radius).to(equal(view.layer.shadowRadius))
                expect(view.shadow.color?.cgColor).to(equal(view.layer.shadowColor))
                expect(view.shadow.opacity).to(equal(view.layer.shadowOpacity))
                expect(view.shadow.shouldRasterize).to(equal(view.layer.shouldRasterize))
            }

            it("should set shadow properly") {
                view.border = UIView.Border(width: 1.23, color: UIColor(red: 0.12, green: 0.34, blue: 0.56))

                expect(view.layer.borderWidth).to(equal(1.23))
                expect(view.layer.borderColor).to(equal(UIColor(red: 0.12, green: 0.34, blue: 0.56).cgColor))
            }

            it("should set shadow properly") {
                view.border = UIView.Border(width: 0.0, color: nil)

                expect(view.layer.borderWidth).to(equal(0.0))
                expect(view.layer.borderColor).to(beNil())
            }
        }
    }
}
