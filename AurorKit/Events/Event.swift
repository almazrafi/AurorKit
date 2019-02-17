//
//  Event.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 12/05/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import Foundation

public class Event<T> {

    // MARK: - Nested Types

    public typealias Handler = ((T) -> Void)

    // MARK: - Instance Properties

    public private(set) var connections: [EventConnection<T>] = []

    // MARK: - Initializers

    public init() { }

    // MARK: - Instance Methods

    internal func registerConnection(_ connection: EventConnection<T>) {
        if !self.connections.contains(where: { $0 === connection }) {
            self.connections.append(connection)
        }
    }

    internal func unregisterConnection(_ connection: EventConnection<T>) {
        self.connections.removeAll(where: { $0 === connection })
    }

    @discardableResult
    public func connect(_ receiver: AnyObject, handler: @escaping Handler) -> EventConnection<T> {
        return EventConnection(event: self,
                               receiver: receiver,
                               handler: handler)
    }

    public func disconnect(_ receiver: AnyObject) {
        self.connections.removeAll(where: { $0.receiver === receiver })
    }

    public func emit(data: T) {
        self.connections.forEach({ $0.emit(data: data) })
    }
}

// MARK: -

extension Event where T == Void {

    // MARK: - Instance Methods

    public func emit() {
        self.emit(data: Void())
    }
}
