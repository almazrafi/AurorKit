import Foundation

import Quick
import Nimble

@testable import AurorKit

class LogTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var printer: MockLogPrinter!

        beforeEach {
            printer = MockLogPrinter()

            Log.printers.forEach { printer in
                Log.unregisterPrinter(printer)
            }
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
            it("should register only unique printers") {
                Log.registerPrinter(printer)
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

        context("when it has printer") {
            var date: Date!
            var dateFormatter: DateFormatter!

            beforeSuite {
                date = Date()
                dateFormatter = DateFormatter()

                dateFormatter.dateFormat = "[HH:mm:ss.SSSS]"
            }

            beforeEach {
                Log.dateFormat = "[HH:mm:ss.SSSS]"

                Log.registerPrinter(printer)
            }

            describe(".low(:from:date:)") {
                it("should call the printer with correct arguments") {
                    let dateString = dateFormatter.string(from: date)

                    Log.low("Something happened", from: self, date: date)

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(equal("\(dateString) <*  > LogTests: Something happened"))
                }

                it("should call the printer with correct arguments") {
                    let dateString = dateFormatter.string(from: date)

                    Log.low("Something happened", from: nil, date: date)

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(equal("\(dateString) <*  > Something happened"))
                }
            }

            describe(".low(:date:)") {
                it("should call the printer with correct arguments") {
                    let dateString = dateFormatter.string(from: date)

                    Log.low("Something happened", date: date)

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(equal("\(dateString) <*  > Something happened"))
                }
            }

            describe(".low(:)") {
                it("should call the printer with correct arguments") {
                    Log.low("Something happened")

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(endWith("<*  > Something happened"))
                }
            }

            describe(".medium(:from:date:)") {
                it("should call the printer with correct arguments") {
                    let dateString = dateFormatter.string(from: date)

                    Log.medium("Something happened", from: self, date: date)

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(equal("\(dateString) <** > LogTests: Something happened"))
                }

                it("should call the printer with correct arguments") {
                    let dateString = dateFormatter.string(from: date)

                    Log.medium("Something happened", from: nil, date: date)

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(equal("\(dateString) <** > Something happened"))
                }
            }

            describe(".medium(:date:)") {
                it("should call the printer with correct arguments") {
                    let dateString = dateFormatter.string(from: date)

                    Log.medium("Something happened", date: date)

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(equal("\(dateString) <** > Something happened"))
                }
            }

            describe(".medium(:)") {
                it("should call the printer with correct arguments") {
                    Log.medium("Something happened")

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(endWith("<** > Something happened"))
                }
            }

            describe(".high(:from:date:)") {
                it("should call the printer with correct arguments") {
                    let dateString = dateFormatter.string(from: date)

                    Log.high("Something happened", from: self, date: date)

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(equal("\(dateString) <***> LogTests: Something happened"))
                }

                it("should call the printer with correct arguments") {
                    let dateString = dateFormatter.string(from: date)

                    Log.high("Something happened", from: nil, date: date)

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(equal("\(dateString) <***> Something happened"))
                }
            }

            describe(".high(:date:)") {
                it("should call the printer with correct arguments") {
                    let dateString = dateFormatter.string(from: date)

                    Log.high("Something happened", date: date)

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(equal("\(dateString) <***> Something happened"))
                }
            }

            describe(".high(:)") {
                it("should call the printer with correct arguments") {
                    Log.high("Something happened")

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(endWith("<***> Something happened"))
                }
            }

            describe(".extra(:from:date:)") {
                it("should call the printer with correct arguments") {
                    let dateString = dateFormatter.string(from: date)

                    Log.extra("Something happened", from: self, date: date)

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(equal("\(dateString) <---> LogTests: Something happened"))
                }

                it("should call the printer with correct arguments") {
                    let dateString = dateFormatter.string(from: date)

                    Log.extra("Something happened", from: nil, date: date)

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(equal("\(dateString) <---> Something happened"))
                }
            }

            describe(".extra(:date:)") {
                it("should call the printer with correct arguments") {
                    let dateString = dateFormatter.string(from: date)

                    Log.extra("Something happened", date: date)

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(equal("\(dateString) <---> Something happened"))
                }
            }

            describe(".extra(:)") {
                it("should call the printer with correct arguments") {
                    Log.extra("Something happened")

                    expect(printer.printCallCount).to(equal(1))
                    expect(printer.printArguments).to(endWith("<---> Something happened"))
                }
            }
        }
    }
}
