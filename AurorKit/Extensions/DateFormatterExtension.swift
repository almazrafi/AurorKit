//
//  DateFormatterExtension.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 15/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

extension DateFormatter {

    // MARK: - Initializers

    public convenience init(dateFormat: String) {
        self.init()

        self.dateFormat = dateFormat
    }
}
