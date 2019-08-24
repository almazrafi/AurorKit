import Foundation

public class EventConnection<Context> {

    // MARK: - Instance Properties

    internal let handler: Event<Context>.Handler

    // MARK: -

    public private(set) weak var event: Event<Context>?
    public private(set) weak var receiver: AnyObject?

    public var isActive: Bool {
        return (receiver != nil) && (event?.connections.contains { $0 === self } == true)
    }

    // MARK: - Initializers

    internal init(event: Event<Context>, receiver: AnyObject, handler: @escaping Event<Context>.Handler) {
        self.handler = handler

        self.event = event
        self.receiver = receiver

        event.registerConnection(self)
    }

    // MARK: - Instance Methods

    internal func emit(_ context: Context) {
        if receiver != nil {
            handler(context)
        } else {
            deactivate()
        }
    }

    // MARK: -

    public func deactivate() {
        event?.unregisterConnection(self)
    }

    public func activate() {
        event?.registerConnection(self)
    }
}
