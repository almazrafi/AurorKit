//
//  EventConnection.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 12/05/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import Foundation

public class EventConnection<T> {

    // MARK: - Instance Properties

    public private(set) weak var event: Event<T>?
    public private(set) weak var receiver: AnyObject?

    public var isActive: Bool {
        return self.event?.connections.contains(where: { $0 === self }) ?? false
    }

    // MARK: -

    internal let handler: Event<T>.Handler

    // MARK: - Initializers

    internal init(event: Event<T>, receiver: AnyObject, handler: @escaping Event<T>.Handler, activated: Bool = true) {
        self.event = event
        self.receiver = receiver
        self.handler = handler

        if activated {
            self.event?.registerConnection(self)
        }
    }

    // MARK: - Instance Methods

    internal func emit(data: T) {
        if self.receiver != nil {
            self.handler(data)
        }
    }

    // MARK: -

    public func deactivate() {
        self.event?.unregisterConnection(self)
    }

    public func activate() {
        self.event?.registerConnection(self)
    }
}
