//
//  EventTests.swift
//  AurorKit/Events
//
//  Created by Almaz Ibragimov on 18/01/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import AurorKit

class EventTests: QuickSpec {
    
    // MARK: - Instance Methods
    
    override func spec() {
        context("Event where T is Int", {
            var event: Event<Int>!
            var eventHandlerMock: EventHandlerMock<Int>!
            
            beforeEach({
                event = Event<Int>()
                eventHandlerMock = EventHandlerMock<Int>()
            })
            
            context("Initializers", {
                describe(".init()", {
                    it("should initialize properly", closure: {
                        expect(event.connections).to(beEmpty())
                    })
                })
            })
            
            context("Instance Methods", {
                var eventConnection: EventConnection<Int>!
                
                beforeEach({
                    eventConnection = event.connect(self, handler: eventHandlerMock.handler)
                })
                
                describe(".register(connection:)", {
                    it("should re-register the connection", closure: {
                        event.register(connection: eventConnection)
                        
                        expect(event.connections.count).to(equal(1))
                        expect(event.connections.first).to(beIdenticalTo(eventConnection))
                    })
                })
                
                describe(".unregister(connection:)", {
                    it("should unregister the connection", closure: {
                        event.unregister(connection: eventConnection)
                        
                        expect(event.connections).toNot(containElementSatisfying({ $0 === eventConnection }))
                    })
                })
                
                describe(".connect(_ receiver:, handler:)", {
                    it("should create the properly connection", closure: {
                        expect(eventConnection.event).to(beIdenticalTo(event))
                        expect(eventConnection.receiver).to(beIdenticalTo(self))
                        expect(eventConnection.isActive).to(beTrue())
                    })
                    
                    it("should register the created connection", closure: {
                        expect(event.connections.count).to(equal(1))
                        expect(event.connections.first).to(beIdenticalTo(eventConnection))
                    })
                })
                
                describe(".disconnect(_ receiver:)", {
                    it("should unregister all connections of the receiver", closure: {
                        event.disconnect(self)
                        
                        expect(event.connections).toNot(containElementSatisfying({ $0.receiver === self }))
                    })
                })
                
                describe(".emit(data:)", {
                    it("should not call the handler prematurely", closure: {
                        expect(eventHandlerMock.handlerCallCount).to(equal(0))
                        expect(eventHandlerMock.handlerParameters).to(beNil())
                    })
                    
                    it("should not call the handler when the connection is deactivated", closure: {
                        eventConnection.deactivate()
                        
                        event.emit(data: 123)
                        
                        expect(eventHandlerMock.handlerCallCount).to(equal(0))
                        expect(eventHandlerMock.handlerParameters).to(beNil())
                    })
                    
                    it("should call the handler with the correct data", closure: {
                        event.emit(data: 123)
                        
                        expect(eventHandlerMock.handlerCallCount).to(equal(1))
                        expect(eventHandlerMock.handlerParameters).to(equal(123))
                    })
                })
            })
        })
        
        context("Event where T is Void", {
            var event: Event<Void>!
            var eventHandlerMock: EventHandlerMock<Void>!
            
            beforeEach({
                event = Event<Void>()
                eventHandlerMock = EventHandlerMock<Void>()
            })
            
            context("Instance Methods", {
                describe(".emit()", {
                    it("should call the handler with the correct data", closure: {
                        event.connect(self, handler: eventHandlerMock.handler)
                        
                        event.emit()
                        
                        expect(eventHandlerMock.handlerCallCount).to(equal(1))
                        expect(eventHandlerMock.handlerParameters).toNot(beNil())
                    })
                })
            })
        })
    }
}

class EventHandlerMock<T> {
    
    // MARK: - Instance Properties
    
    private(set) var handlerCallCount = 0
    private(set) var handlerParameters: T?
    
    private(set) lazy var handler: (T) -> Void = { data in
        self.handlerCallCount += 1
        self.handlerParameters = data
    }
}
