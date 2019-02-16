//
//  LogTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 16/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import AurorKit

class LogTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var printer: LogPrinterMock!

        beforeEach {
            printer = LogPrinterMock()

            Log.printers.forEach({ printer in
                Log.unregisterPrinter(printer)
            })
        }

        describe(".dateFormat") {
            it("should set date format properly") {
                Log.dateFormat = "HH"

                expect(Log.dateFormat).to(equal("HH"))
            }

            it("should set date format properly") {
                Log.dateFormat = ""

                expect(Log.dateFormat).to(equal(""))
            }
        }

        describe(".registerPrinter(:)") {
            it("should register the printer") {
                Log.registerPrinter(printer)

                expect(Log.printers.count).to(equal(1))
                expect(Log.printers.first).to(beIdenticalTo(printer))
            }
        }

        describe(".unregisterPrinter(:)") {
            beforeEach {
                Log.registerPrinter(printer)
            }

            it("should unregister the printer") {
                Log.unregisterPrinter(printer)

                expect(Log.printers).to(beEmpty())
            }
        }

        describe(".low(:, from:, date:)") {
            beforeEach {
                Log.dateFormat = "HH:mm:ss.SSSS"

                Log.registerPrinter(printer)
            }

            it("should call the printer with correct parameters") {
                let date = Date(timeIntervalSinceReferenceDate: 123.0)

                Log.low("Bla bla bla", from: self, date: date)

                expect(printer.printCallCount).to(equal(1))
                expect(printer.printParameters).to(equal("[03:02:03.0000] <*  > LogTests: Bla bla bla"))
            }

            it("should call the printer with correct parameters") {
                let date = Date(timeIntervalSinceReferenceDate: 0.0)

                Log.low("Bla bla bla", from: nil, date: date)

                expect(printer.printCallCount).to(equal(1))
                expect(printer.printParameters).to(equal("[03:00:00.0000] <*  > Bla bla bla"))
            }
        }

        describe(".medium(:, from:, date:)") {
            beforeEach {
                Log.dateFormat = "HH:mm:ss.SSSS"

                Log.registerPrinter(printer)
            }

            it("should call the printer with correct parameters") {
                let date = Date(timeIntervalSinceReferenceDate: 123.0)

                Log.medium("Bla bla bla", from: self, date: date)

                expect(printer.printCallCount).to(equal(1))
                expect(printer.printParameters).to(equal("[03:02:03.0000] <** > LogTests: Bla bla bla"))
            }

            it("should call the printer with correct parameters") {
                let date = Date(timeIntervalSinceReferenceDate: 0.0)

                Log.medium("Bla bla bla", from: nil, date: date)

                expect(printer.printCallCount).to(equal(1))
                expect(printer.printParameters).to(equal("[03:00:00.0000] <** > Bla bla bla"))
            }
        }

        describe(".high(:, from:, date:)") {
            beforeEach {
                Log.dateFormat = "HH:mm:ss.SSSS"

                Log.registerPrinter(printer)
            }

            it("should call the printer with correct parameters") {
                let date = Date(timeIntervalSinceReferenceDate: 123.0)

                Log.high("Bla bla bla", from: self, date: date)

                expect(printer.printCallCount).to(equal(1))
                expect(printer.printParameters).to(equal("[03:02:03.0000] <***> LogTests: Bla bla bla"))
            }

            it("should call the printer with correct parameters") {
                let date = Date(timeIntervalSinceReferenceDate: 0.0)

                Log.high("Bla bla bla", from: nil, date: date)

                expect(printer.printCallCount).to(equal(1))
                expect(printer.printParameters).to(equal("[03:00:00.0000] <***> Bla bla bla"))
            }
        }

        describe(".extra(:, from:, date:)") {
            beforeEach {
                Log.dateFormat = "HH:mm:ss.SSSS"

                Log.registerPrinter(printer)
            }

            it("should call the printer with correct parameters") {
                let date = Date(timeIntervalSinceReferenceDate: 123.0)

                Log.extra("Bla bla bla", from: self, date: date)

                expect(printer.printCallCount).to(equal(1))
                expect(printer.printParameters).to(equal("[03:02:03.0000] <---> LogTests: Bla bla bla"))
            }

            it("should call the printer with correct parameters") {
                let date = Date(timeIntervalSinceReferenceDate: 0.0)

                Log.extra("Bla bla bla", from: nil, date: date)

                expect(printer.printCallCount).to(equal(1))
                expect(printer.printParameters).to(equal("[03:00:00.0000] <---> Bla bla bla"))
            }
        }
    }
}
