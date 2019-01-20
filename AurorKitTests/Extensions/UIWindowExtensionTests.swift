//
//  UIWindowExtensionTests.swift
//  AurorKit/Extensions
//
//  Created by Almaz Ibragimov on 20/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIWindowExtensionTests: QuickSpec {
    
    // MARK: - Instance Methods
    
    override func spec() {
        var rootViewController: UIViewController!
        var modalViewController: UIViewController!
        
        var window: UIWindow!
        
        beforeEach({
            rootViewController = UITabBarController()
            modalViewController = UIViewController()
            
            window = UIWindow(frame: UIScreen.main.bounds)
        })
        
        context("Instance Properties", {
            describe(".topViewController", {
                it("should return nil", closure: {
                    expect(window.topViewController).to(beNil())
                })
                
                it("should return root view controller", closure: {
                    window.rootViewController = rootViewController
                    
                    expect(window.topViewController).to(beIdenticalTo(rootViewController))
                })
                
                it("should return modal view controller", closure: {
                    window.rootViewController = rootViewController
                  
                    rootViewController.present(modalViewController, animated: true)

                    expect(window.topViewController).toEventually(beIdenticalTo(rootViewController))
                })

                it("should return modal view controller", closure: {
                    window.rootViewController = rootViewController
                    
                    rootViewController.present(modalViewController, animated: false)

                    expect(window.topViewController).toEventually(beIdenticalTo(rootViewController))
                })
            })
        })
    }
}
