//
//  LogPrinterMock.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 16/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation
import AurorKit

class LogPrinterMock: LogPrinter {

    // MARK: - Instance Properties

    private(set) var printCallCount = 0
    private(set) var printParameters: String?

    // MARK: - Instance Methods

    func print(_ line: String) {
        self.printCallCount += 1
        self.printParameters = line

        Swift.print(line)
    }
}
