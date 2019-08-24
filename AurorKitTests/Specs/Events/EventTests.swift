import Foundation

import Quick
import Nimble

@testable import AurorKit

class EventTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        context("where Context is not Void") {
            var event: Event<Int>!
            var eventReceiver: MockEventReceiver<Int>!

            beforeEach {
                event = Event<Int>()
                eventReceiver = MockEventReceiver<Int>()
            }

            describe(".init()") {
                it("should initialize properly") {
                    expect(event.connections).to(beEmpty())
                }
            }

            context("when it has connections") {
                var eventConnection: EventConnection<Int>!

                beforeEach {
                    eventConnection = event.connect(eventReceiver, handler: eventReceiver.handler)
                }

                describe(".register(connection:)") {
                    it("should register only unique connections") {
                        event.registerConnection(eventConnection)
                        event.registerConnection(eventConnection)

                        expect(event.connections.count).to(equal(1))
                        expect(event.connections.first).to(be(eventConnection))
                    }
                }

                describe(".unregister(connection:)") {
                    it("should unregister the connection") {
                        event.unregisterConnection(eventConnection)

                        expect(event.connections).toNot(containElementSatisfying({ $0 === eventConnection }))
                    }
                }

                describe(".connect(:handler:)") {
                    it("should create a valid connection") {
                        expect(eventConnection.event).to(be(event))
                        expect(eventConnection.receiver).to(be(eventReceiver))
                        expect(eventConnection.isActive).to(beTrue())
                    }

                    it("should register the created connection") {
                        expect(event.connections.count).to(equal(1))
                        expect(event.connections.first).to(be(eventConnection))
                    }
                }

                describe(".disconnect(:)") {
                    it("should unregister all connections of the receiver") {
                        event.disconnect(eventReceiver)

                        expect(event.connections).toNot(containElementSatisfying({ $0.receiver === eventReceiver }))
                    }
                }

                describe(".emit(:)") {
                    it("should not call the handler prematurely") {
                        expect(eventReceiver.handlerCallCount).to(equal(0))
                        expect(eventReceiver.handlerArguments).to(beNil())
                    }

                    it("should not call the handler when the connection is deactivated") {
                        eventConnection.deactivate()

                        event.emit(123)

                        expect(eventReceiver.handlerCallCount).to(equal(0))
                        expect(eventReceiver.handlerArguments).to(beNil())
                    }

                    it("should call the handler with the correct data") {
                        event.emit(123)

                        expect(eventReceiver.handlerCallCount).to(equal(1))
                        expect(eventReceiver.handlerArguments).to(equal(123))
                    }
                }
            }
        }

        context("where Context is Void") {
            var event: Event<Void>!
            var eventReceiver: MockEventReceiver<Void>!

            beforeEach {
                event = Event<Void>()
                eventReceiver = MockEventReceiver<Void>()
            }

            describe(".emit()") {
                it("should call the handler with the correct data") {
                    event.connect(eventReceiver, handler: eventReceiver.handler)

                    event.emit()

                    expect(eventReceiver.handlerCallCount).to(equal(1))
                    expect(eventReceiver.handlerArguments).toNot(beNil())
                }
            }
        }
    }
}
