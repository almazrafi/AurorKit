import Foundation

public class Event<Context> {

    // MARK: - Nested Types

    public typealias Handler1 = ((_ context: Context) -> Void)

    // MARK: - Instance Properties

    public private(set) var connections: [EventConnection<Context>] = []

    // MARK: - Initializers

    public init() { }

    // MARK: - Instance Methods

    internal func registerConnection(_ connection: EventConnection<Context>) {
        if !connections.contains(where: { $0 === connection }) {
            connections.append(connection)
        }
    }

    internal func unregisterConnection(_ connection: EventConnection<Context>) {
        connections.removeAll { $0 === connection }
    }

    @discardableResult
    public func connect(_ receiver: AnyObject, handler: @escaping Handler) -> EventConnection<Context> {
        return EventConnection(
            event: self,
            receiver: receiver,
            handler: handler
        )
    }

    public func disconnect(_ receiver: AnyObject) {
        connections.removeAll { $0.receiver === receiver }
    }

    public func emit(_ context: Context) {
        connections.forEach { $0.emit(context) }
    }
}

// MARK: - where Context == Void

extension Event where Context == Void {

    // MARK: - Instance Methods

    public func emit() {
        emit(Void())
    }
}
