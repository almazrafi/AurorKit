//
//  UIViewExtensionTests.swift
//  AurorKit/Extensions
//
//  Created by Almaz Ibragimov on 20/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIViewExtensionTests: QuickSpec {
    
    // MARK: - Instance Methods
    
    override func spec() {
        context("Instance Properties", {
            let view = UIView()
            
            describe(".safeAreaLeadingAnchor", {
                it("should return the leading anchor", closure: {
                    let leadingAnchor = view.safeAreaLeadingAnchor
                  
                    if #available(iOS 11.0, tvOS 11.0, *) {
                        expect(leadingAnchor).to(beIdenticalTo(view.safeAreaLayoutGuide.leadingAnchor))
                    } else {
                        expect(leadingAnchor).to(beIdenticalTo(view.leadingAnchor))
                    }
                })
            })
            
            describe(".safeAreaTrailingAnchor", {
                it("should return the trailing anchor", closure: {
                    let trailingAnchor = view.safeAreaTrailingAnchor
                    
                    if #available(iOS 11.0, tvOS 11.0, *) {
                        expect(trailingAnchor).to(beIdenticalTo(view.safeAreaLayoutGuide.trailingAnchor))
                    } else {
                        expect(trailingAnchor).to(beIdenticalTo(view.trailingAnchor))
                    }
                })
            })
            
            describe(".safeAreaTopAnchor", {
                it("should return the top anchor", closure: {
                    let topAnchor = view.safeAreaTopAnchor
                  
                    if #available(iOS 11.0, tvOS 11.0, *) {
                        expect(topAnchor).to(beIdenticalTo(view.safeAreaLayoutGuide.topAnchor))
                    } else {
                        expect(topAnchor).to(beIdenticalTo(view.topAnchor))
                    }
                })
            })
            
            describe(".safeAreaBottomAnchor", {
                it("should return the bottom anchor", closure: {
                    let bottomAnchor = view.safeAreaBottomAnchor
                    
                    if #available(iOS 11.0, tvOS 11.0, *) {
                        expect(bottomAnchor).to(beIdenticalTo(view.safeAreaLayoutGuide.bottomAnchor))
                    } else {
                        expect(bottomAnchor).to(beIdenticalTo(view.bottomAnchor))
                    }
                })
            })
            
            describe(".safeAreaWidthAnchor", {
                it("should return the width anchor", closure: {
                    let widthAnchor = view.safeAreaWidthAnchor
                    
                    if #available(iOS 11.0, tvOS 11.0, *) {
                        expect(widthAnchor).to(beIdenticalTo(view.safeAreaLayoutGuide.widthAnchor))
                    } else {
                        expect(widthAnchor).to(beIdenticalTo(view.widthAnchor))
                    }
                })
            })
            
            describe(".safeAreaHeightAnchor", {
                it("should return the height anchor", closure: {
                    let heightAnchor = view.safeAreaHeightAnchor
                    
                    if #available(iOS 11.0, tvOS 11.0, *) {
                        expect(heightAnchor).to(beIdenticalTo(view.safeAreaLayoutGuide.heightAnchor))
                    } else {
                        expect(heightAnchor).to(beIdenticalTo(view.heightAnchor))
                    }
                })
            })
            
            describe(".safeAreaCenterXAnchor", {
                it("should return the horizontal center anchor", closure: {
                    let centerXAnchor = view.safeAreaCenterXAnchor
                    
                    if #available(iOS 11.0, tvOS 11.0, *) {
                        expect(centerXAnchor).to(beIdenticalTo(view.safeAreaLayoutGuide.centerXAnchor))
                    } else {
                        expect(centerXAnchor).to(beIdenticalTo(view.centerXAnchor))
                    }
                })
            })
            
            describe(".safeAreaCenterYAnchor", {
                it("should return the vertical center anchor", closure: {
                    let centerYAnchor = view.safeAreaCenterYAnchor
                    
                    if #available(iOS 11.0, tvOS 11.0, *) {
                        expect(centerYAnchor).to(beIdenticalTo(view.safeAreaLayoutGuide.centerYAnchor))
                    } else {
                        expect(centerYAnchor).to(beIdenticalTo(view.centerYAnchor))
                    }
                })
            })
        })
    }
}
