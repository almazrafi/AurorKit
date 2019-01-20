//
//  CollectionExtensionTests.swift
//  AurorKit/Extensions
//
//  Created by Almaz Ibragimov on 19/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import AurorKit

class CollectionExtensionTests: QuickSpec {
    
    // MARK: - Instance Methods
    
    override func spec() {
        context("Instance Subscripts", {
            describe(".subscript(safe:)", {
                it("should return an element", closure: {
                    let collection = [1, 2, 3, 4, 5]
                    
                    expect(collection[safe: 0]).to(equal(1))
                })
                
                it("should return an element", closure: {
                    let collection = [1, 2, 3, 4, 5]
                    
                    expect(collection[safe: 4]).to(equal(5))
                })
                
                it("should return nil", closure: {
                    let collection = [1, 2, 3, 4, 5]
                    
                    expect(collection[safe: 5]).to(beNil())
                })
            })
        })
            
        context("Instance Methods", {
            describe(".contains(index:)", {
                it("should contains the index", closure: {
                    let collection = [1, 2, 3, 4, 5]
                    
                    expect(collection.contains(index: 0)).to(beTrue())
                })
                
                it("should contains the index", closure: {
                    let collection = [1, 2, 3, 4, 5]
                    
                    expect(collection.contains(index: 4)).to(beTrue())
                })
                
                it("should not contains the index", closure: {
                    let collection = [1, 2, 3, 4, 5]
                    
                    expect(collection.contains(index: 5)).to(beFalse())
                })
            })
            
            describe(".split(maxSplits:, by:)", {
                it("should return empty collection", closure: {
                    let collection = Array<Int>().split(maxSplits: 1, by: { $0 == $1 })
                    
                    expect(collection).to(beEmpty())
                })
                
                it("should return a properly split collection", closure: {
                    let collection = [1, 2, 3, 4, 5].split(maxSplits: 0, by: { $0 == $1 })
                    
                    expect(collection).to(equal([[1, 2, 3, 4, 5]]))
                })

                it("should return a properly split collection", closure: {
                    let collection = [1, 2, 3, 4, 5].split(maxSplits: 1, by: { $0 == $1 })
                    
                    expect(collection).to(equal([[1], [2, 3, 4, 5]]))
                })
                
                it("should return a properly split collection", closure: {
                    let collection = [1, 2, 3, 4, 5].split(maxSplits: 5, by: { $0 == $1 })
                    
                    expect(collection).to(equal([[1], [2], [3], [4], [5]]))
                })
                
                it("should return a properly split collection", closure: {
                    let collection = [1, 1, 2, 3, 3, 3].split(maxSplits: 3, by: { $0 == $1 })
                    
                    expect(collection).to(equal([[1, 1], [2], [3, 3, 3]]))
                })
            })
            
            describe(".split(by:)", {
                it("should return empty collection", closure: {
                    let collection = Array<Int>().split(by: { $0 == $1 })
                    
                    expect(collection).to(beEmpty())
                })
                
                it("should return a properly split collection", closure: {
                    let collection = [1, 2, 3, 4, 5].split(by: { $0 == $1 })
                    
                    expect(collection).to(equal([[1], [2], [3], [4], [5]]))
                })
                
                it("should return a properly split collection", closure: {
                    let collection = [1, 1, 2, 3, 3, 3].split(by: { $0 == $1 })
                    
                    expect(collection).to(equal([[1, 1], [2], [3, 3, 3]]))
                })
            })
        })
    }
}
