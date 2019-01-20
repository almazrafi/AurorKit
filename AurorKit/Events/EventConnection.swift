//
//  EventConnection.swift
//  AurorKit/Events
//
//  Created by Almaz Ibragimov on 12/05/2018.
//  Copyright © 2018 Aurors. All rights reserved.
//

import Foundation

public final class EventConnection<T> {
    
    // MARK: - Instance Properties
    
    public private(set) weak var event: Event<T>?
    public private(set) weak var receiver: AnyObject?
    
    public var isActive: Bool {
        return self.event?.connections.contains(where: { $0 === self }) ?? false
    }
    
    // MARK: -
    
    let handler: Event<T>.Handler
    
    // MARK: - Initializers
    
    init(event: Event<T>, receiver: AnyObject, handler: @escaping Event<T>.Handler, isActive: Bool = true) {
        self.event = event
        self.receiver = receiver
        self.handler = handler
        
        if isActive {
            self.event?.register(connection: self)
        }
    }
    
    // MARK: - Instance Methods
    
    func emit(data: T) {
        if self.receiver != nil {
            self.handler(data)
        }
    }
    
    // MARK: -
    
    public func deactivate() {
        self.event?.unregister(connection: self)
    }
    
    public func activate() {
        self.event?.register(connection: self)
    }
}
