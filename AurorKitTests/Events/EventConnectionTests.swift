//
//  EventConnectionTests.swift
//  AurorKit/Events
//
//  Created by Almaz Ibragimov on 19/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import AurorKit

class EventConnectionTests: QuickSpec {

    // MARK: - Instance Methods
    
    override func spec() {
        var event: Event<Int>!
        var eventHandlerMock: EventHandlerMock<Int>!
        var eventConnection: EventConnection<Int>!
        
        beforeEach({
            event = Event<Int>()
            eventHandlerMock = EventHandlerMock<Int>()
        })
        
        context("Initializers", {
            describe(".init(event:, receiver:, handler:, isActive:)", {
                it("should initialize properly", closure: {
                    eventConnection = EventConnection<Int>(event: event,
                                                           receiver: self,
                                                           handler: eventHandlerMock.handler)
                    
                    expect(eventConnection.event).to(beIdenticalTo(event))
                    expect(eventConnection.receiver).to(beIdenticalTo(self))
                    expect(eventConnection.isActive).to(beTrue())
                })
                
                it("should initialize as inactive", closure: {
                    eventConnection = EventConnection<Int>(event: event,
                                                           receiver: self,
                                                           handler: eventHandlerMock.handler,
                                                           isActive: false)
                    
                    expect(eventConnection.isActive).to(beFalse())
                    expect(event.connections.count).to(equal(0))
                })
                
                it("should initialize as active", closure: {
                    eventConnection = EventConnection<Int>(event: event,
                                                           receiver: self,
                                                           handler: eventHandlerMock.handler,
                                                           isActive: true)
                    
                    expect(eventConnection.isActive).to(beTrue())
                    expect(event.connections.count).to(equal(1))
                    expect(event.connections.first).to(beIdenticalTo(eventConnection))
                })
            })
        })
        
        context("Instance Methods", {
            beforeEach({
                eventConnection = EventConnection<Int>(event: event,
                                                       receiver: self,
                                                       handler: eventHandlerMock.handler)
            })
            
            describe(".emit(data:)", {
                it("should not call the handler prematurely", closure: {
                    expect(eventHandlerMock.handlerCallCount).to(equal(0))
                    expect(eventHandlerMock.handlerParameters).to(beNil())
                })
                
                it("should call the handler with the correct data", closure: {
                    eventConnection.emit(data: 123)
                    
                    expect(eventHandlerMock.handlerCallCount).to(equal(1))
                    expect(eventHandlerMock.handlerParameters).to(equal(123))
                })
            })
            
            describe(".activate()", {
                it("should change state to active", closure: {
                    eventConnection.deactivate()
                    eventConnection.activate()
                    
                    expect(eventConnection.isActive).to(beTrue())
                    expect(event.connections.count).to(equal(1))
                    expect(event.connections.first).to(beIdenticalTo(eventConnection))
                })
            })
            
            describe(".deactivate()", {
                it("should change state to inactive", closure: {
                    eventConnection.activate()
                    eventConnection.deactivate()
                    
                    expect(eventConnection.isActive).to(beFalse())
                    expect(event.connections.count).to(equal(0))
                })
            })
        })
    }
}
