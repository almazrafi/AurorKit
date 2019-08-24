import Foundation

import Quick
import Nimble

@testable import AurorKit

class EventConnectionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var event: Event<Int>!
        var eventReceiver: MockEventReceiver<Int>!

        beforeEach {
            event = Event<Int>()
            eventReceiver = MockEventReceiver<Int>()
        }

        describe(".init(event:receiver:handler:isActive:)") {
            it("should initialize properly") {
                let eventConnection = EventConnection<Int>(
                    event: event,
                    receiver: eventReceiver,
                    handler: eventReceiver.handler
                )

                expect(eventConnection.event).to(be(event))
                expect(eventConnection.receiver).to(be(eventReceiver))
                expect(eventConnection.isActive).to(beTrue())
            }
        }

        context("when it is initialized") {
            var eventConnection: EventConnection<Int>!

            beforeEach {
                eventConnection = EventConnection<Int>(
                    event: event,
                    receiver: eventReceiver,
                    handler: eventReceiver.handler
                )
            }

            describe(".isActive") {
                it("should be active") {
                    expect(eventConnection.isActive).to(beTrue())
                }

                it("should be inactive if the receiver is nil") {
                    eventReceiver = nil

                    expect(eventConnection.isActive).to(beFalse())
                }
            }

            describe(".emit(:)") {
                it("should not call the handler prematurely") {
                    expect(eventReceiver.handlerCallCount).to(equal(0))
                    expect(eventReceiver.handlerArguments).to(beNil())
                }

                it("should call the handler with the correct data") {
                    eventConnection.emit(123)

                    expect(eventReceiver.handlerCallCount).to(equal(1))
                    expect(eventReceiver.handlerArguments).to(equal(123))
                }

                it("should deactivate the connection if the receiver is nil") {
                    eventReceiver = nil

                    eventConnection.emit(123)

                    expect(eventConnection.isActive).to(beFalse())
                    expect(event.connections.count).to(equal(0))
                }
            }

            describe(".activate()") {
                it("should change state to active") {
                    eventConnection.deactivate()
                    eventConnection.activate()

                    expect(eventConnection.isActive).to(beTrue())
                    expect(event.connections.count).to(equal(1))
                    expect(event.connections.first).to(be(eventConnection))
                }

                it("should have no effect if the event is nil") {
                    event = nil

                    eventConnection.deactivate()
                    eventConnection.activate()

                    expect(eventConnection.isActive).to(beFalse())
                }
            }

            describe(".deactivate()") {
                it("should change state to inactive") {
                    eventConnection.activate()
                    eventConnection.deactivate()

                    expect(eventConnection.isActive).to(beFalse())
                    expect(event.connections.count).to(equal(0))
                }

                it("should have no effect if the event is nil") {
                    event = nil

                    eventConnection.activate()
                    eventConnection.deactivate()

                    expect(eventConnection.isActive).to(beFalse())
                }
            }
        }
    }
}
