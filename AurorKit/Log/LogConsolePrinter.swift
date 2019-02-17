//
//  LogConsolePrinter.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 15/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

public class LogConsolePrinter: LogPrinter {

    // MARK: - Type Properties

    public static let shared = LogConsolePrinter()

    // MARK: - Initializers

    private init() { }

    // MARK: - Instance Methods

    public func print(_ line: String) {
        Swift.print(line)
    }
}
