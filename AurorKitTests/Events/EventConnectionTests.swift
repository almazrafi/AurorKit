//
//  EventConnectionTests.swift
//  AurorKit
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
        var eventHandler: MockEventHandler<Int>!
        var eventConnection: EventConnection<Int>!

        beforeEach {
            event = Event<Int>()
            eventHandler = MockEventHandler<Int>()
        }

        describe(".init(event:, receiver:, handler:, isActive:)") {
            it("should initialize properly") {
                eventConnection = EventConnection<Int>(event: event,
                                                       receiver: self,
                                                       handler: eventHandler.handler)

                expect(eventConnection.event).to(beIdenticalTo(event))
                expect(eventConnection.receiver).to(beIdenticalTo(self))
                expect(eventConnection.isActive).to(beTrue())
            }

            it("should initialize as inactive") {
                eventConnection = EventConnection<Int>(event: event,
                                                       receiver: self,
                                                       handler: eventHandler.handler,
                                                       activated: false)

                expect(eventConnection.isActive).to(beFalse())
                expect(event.connections.count).to(equal(0))
            }

            it("should initialize as active") {
                eventConnection = EventConnection<Int>(event: event,
                                                       receiver: self,
                                                       handler: eventHandler.handler,
                                                       activated: true)

                expect(eventConnection.isActive).to(beTrue())
                expect(event.connections.count).to(equal(1))
                expect(event.connections.first).to(beIdenticalTo(eventConnection))
            }
        }

        context("when it is initialized") {
            beforeEach {
                eventConnection = EventConnection<Int>(event: event,
                                                       receiver: self,
                                                       handler: eventHandler.handler)
            }

            describe(".emit(data:)") {
                it("should not call the handler prematurely") {
                    expect(eventHandler.handlerCallCount).to(equal(0))
                    expect(eventHandler.handlerParameters).to(beNil())
                }

                it("should call the handler with the correct data") {
                    eventConnection.emit(data: 123)

                    expect(eventHandler.handlerCallCount).to(equal(1))
                    expect(eventHandler.handlerParameters).to(equal(123))
                }
            }

            describe(".activate()") {
                it("should change state to active") {
                    eventConnection.deactivate()
                    eventConnection.activate()

                    expect(eventConnection.isActive).to(beTrue())
                    expect(event.connections.count).to(equal(1))
                    expect(event.connections.first).to(beIdenticalTo(eventConnection))
                }
            }

            describe(".deactivate()") {
                it("should change state to inactive") {
                    eventConnection.activate()
                    eventConnection.deactivate()

                    expect(eventConnection.isActive).to(beFalse())
                    expect(event.connections.count).to(equal(0))
                }
            }
        }
    }
}
