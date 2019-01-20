//
//  UIEdgeInsetsExtensionTests.swift
//  AurorKit/Extensions
//
//  Created by Almaz Ibragimov on 20/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIEdgeInsetsExtensionTests: QuickSpec {
    
    // MARK: - Instance Methods
    
    override func spec() {
        context("Initializers", {
            describe(".init(equilateral:)", {
                it("should initialize properly", closure: {
                    let edgeInsets = UIEdgeInsets(equilateral: 1.23)
                    
                    expect(edgeInsets.top).to(equal(1.23))
                    expect(edgeInsets.left).to(equal(1.23))
                    expect(edgeInsets.bottom).to(equal(1.23))
                    expect(edgeInsets.right).to(equal(1.23))
                })
            })
        })
    }
}
