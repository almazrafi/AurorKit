//
//  LogPrinter.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 15/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

public protocol LogPrinter: AnyObject {

    // MARK: - Instance Methods

    func print(_ line: String)
}
