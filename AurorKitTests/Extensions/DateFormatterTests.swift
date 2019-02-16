//
//  DateFormatterTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 15/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import AurorKit

class DateExtensionTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".init(dateFormat:)") {
            it("should return an empty date format") {
                let dateFormatter = DateFormatter(dateFormat: "")

                expect(dateFormatter.dateFormat).to(beEmpty())
            }

            it("should return the correct date format") {
                let dateFormatter = DateFormatter(dateFormat: "HH:mm:ss.SSSS")

                expect(dateFormatter.dateFormat).to(equal("HH:mm:ss.SSSS"))
            }
        }
    }
}
