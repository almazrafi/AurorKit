//
//  NSLayoutConstraintTests.swift
//  AurorKit/Extensions
//
//  Created by Almaz Ibragimov on 20/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

import Quick
import Nimble

@testable import AurorKit

class NSLayoutConstraintTests: QuickSpec {
    
    // MARK: - Instance Methods
    
    override func spec() {
        var view: UIView!
        
        beforeEach({
            view = UIView()
        })
        
        context("Instance Properties", {
            describe(".preciseConstant", {
                var constraint: NSLayoutConstraint!
                    
                beforeEach({
                    constraint = view.widthAnchor.constraint(equalToConstant: 123.0)
                })

                it("should return an properly constant", closure: {
                    expect(constraint.preciseConstant).to(equal(Int(123.0 * UIScreen.main.scale)))
                })
                
                it("should set an properly constant", closure: {
                    constraint.preciseConstant = 1
                    
                    expect(constraint.constant).to(equal(1.0 / UIScreen.main.scale))
                })
            })
        })
    }
}
