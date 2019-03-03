//
//  MockEventHandler.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 16/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

class MockEventHandler<T> {

    // MARK: - Instance Properties

    private(set) var handlerCallCount = 0
    private(set) var handlerArguments: T?

    private(set) lazy var handler: (T) -> Void = { data in
        self.handlerCallCount += 1
        self.handlerArguments = data
    }
}
