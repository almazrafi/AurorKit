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
                view.shadow = UIView.Shadow(offset: CGSize(width: 1.23, height: 4.56),
                                            radius: 3.21,
                                            color: UIColor(red: 0.12, green: 0.34, blue: 0.56),
                                            opacity: 0.789,
                                            shouldRasterize: true)

                expect(view.layer.shadowOffset).to(equal(CGSize(width: 1.23, height: 4.56)))
                expect(view.layer.shadowRadius).to(equal(3.21))
                expect(view.layer.shadowColor).to(equal(UIColor(red: 0.12, green: 0.34, blue: 0.56).cgColor))
                expect(view.layer.shadowOpacity).to(equal(0.789))
                expect(view.layer.shouldRasterize).to(equal(true))
            }

            it("should set shadow properly") {
                view.shadow = UIView.Shadow(offset: CGSize.zero,
                                            radius: 0.0,
                                            color: nil,
                                            opacity: 0.0,
                                            shouldRasterize: false)

                expect(view.layer.shadowOffset).to(equal(CGSize.zero))
                expect(view.layer.shadowRadius).to(equal(0.0))
                expect(view.layer.shadowColor).to(beNil())
                expect(view.layer.shadowOpacity).to(equal(0.0))
                expect(view.layer.shouldRasterize).to(equal(false))
            }
        }
    }
}
