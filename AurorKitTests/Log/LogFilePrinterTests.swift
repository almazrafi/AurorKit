//
//  LogFilePrinterTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 16/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

import Quick
import Nimble

@testable import AurorKit

class LogFilePrinterTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".init(encoding:fileHeader:fileName:)") {
            context("when the header is not empty") {
                it("should not initialize with invalid file name") {
                    let printer = LogFilePrinter(encoding: .utf8, fileHeader: "Tests Log", fileName: "")

                    expect(printer).to(beNil())
                }

                it("should not initialize with invalid file name") {
                    let printer = LogFilePrinter(encoding: .utf16, fileHeader: "Tests Log", fileName: "/")

                    expect(printer).to(beNil())
                }

                it("should not initialize with invalid file name") {
                    let printer = LogFilePrinter(encoding: .utf8, fileHeader: "Tests Log", fileName: "Log/Tests.log")

                    expect(printer).to(beNil())
                }

                it("should initialize properly") {
                    let printer = LogFilePrinter(encoding: .ascii, fileHeader: "Tests Log", fileName: "Tests.log")

                    expect(printer).toNot(beNil())
                    expect(printer?.encoding).to(equal(.ascii))
                    expect(printer?.fileHeader).to(equal("Tests Log"))
                    expect(printer?.fileName).to(equal("Tests.log"))
                    expect(printer?.filePath).to(endWith("/Tests.log"))
                    expect(printer?.content).to(equal("Tests Log\n"))
                }

                it("should rewrite the content with the header") {
                    let firstPrinter = LogFilePrinter(encoding: .utf8,
                                                      fileHeader: "First Tests Log",
                                                      fileName: "Tests.log")

                    let secondPrinter = LogFilePrinter(encoding: .utf8,
                                                       fileHeader: "Second Tests Log",
                                                       fileName: "Tests.log")

                    expect(firstPrinter?.content).to(equal("Second Tests Log\n"))
                    expect(secondPrinter?.content).to(equal("Second Tests Log\n"))
                }

                it("should rewrite the file with the header") {
                    let printer = LogFilePrinter(encoding: .ascii, fileHeader: "Tests Log", fileName: "Tests.log")

                    expect(printer.flatMap({ printer in
                        return try? String(contentsOfFile: printer.filePath, encoding: .utf8)
                    })).to(equal("Tests Log\n"))
                }
            }

            context("when the header is empty") {
                it("should not initialize with invalid file name") {
                    let printer = LogFilePrinter(encoding: .utf8, fileHeader: "", fileName: "")

                    expect(printer).to(beNil())
                }

                it("should not initialize with invalid file name") {
                    let printer = LogFilePrinter(encoding: .utf16, fileHeader: "", fileName: "/")

                    expect(printer).to(beNil())
                }

                it("should initialize properly") {
                    let printer = LogFilePrinter(encoding: .ascii, fileHeader: "", fileName: "Tests.log")

                    expect(printer).toNot(beNil())
                    expect(printer?.encoding).to(equal(.ascii))
                    expect(printer?.fileHeader).to(beEmpty())
                    expect(printer?.fileName).to(equal("Tests.log"))
                    expect(printer?.filePath).to(endWith("/Tests.log"))
                    expect(printer?.content).to(beEmpty())
                }

                it("should rewrite the content with the header") {
                    let firstPrinter = LogFilePrinter(encoding: .utf8,
                                                      fileHeader: "First Tests Log",
                                                      fileName: "Tests.log")

                    let secondPrinter = LogFilePrinter(encoding: .utf8,
                                                       fileHeader: "",
                                                       fileName: "Tests.log")

                    expect(firstPrinter?.content).to(beEmpty())
                    expect(secondPrinter?.content).to(beEmpty())
                }

                it("should rewrite the file with the header") {
                    let printer = LogFilePrinter(encoding: .ascii, fileHeader: "", fileName: "Tests.log")

                    expect(printer.flatMap({ printer in
                        return try? String(contentsOfFile: printer.filePath, encoding: .utf8)
                    })).to(beEmpty())
                }
            }
        }

        describe(".print(_:)") {
            context("when the header is not empty") {
                var printer: LogFilePrinter?

                beforeEach {
                    printer = LogFilePrinter(encoding: .utf8, fileHeader: "Tests Log", fileName: "Tests.log")
                }

                it("should write the line to the content") {
                    printer?.print("Something happened")

                    expect(printer?.content).to(equal("Tests Log\nSomething happened\n"))
                }

                it("should write the line to the file") {
                    printer?.print("Something happened")

                    expect(printer.flatMap({ printer in
                        return try? String(contentsOfFile: printer.filePath, encoding: .utf8)
                    })).to(equal("Tests Log\nSomething happened\n"))
                }
            }

            context("when the header is empty") {
                var printer: LogFilePrinter?

                beforeEach {
                    printer = LogFilePrinter(encoding: .utf8, fileHeader: "", fileName: "Tests.log")
                }

                describe(".print(_:)") {
                    it("should write line to the content") {
                        printer?.print("Something happened")

                        expect(printer?.content).to(equal("Something happened\n"))
                    }

                    it("should write line to the file") {
                        printer?.print("Something happened")

                        expect(printer.flatMap({ printer in
                            return try? String(contentsOfFile: printer.filePath, encoding: .utf8)
                        })).to(equal("Something happened\n"))
                    }
                }
            }
        }

        describe(".clear()") {
            context("when the header is not empty") {
                var printer: LogFilePrinter?

                beforeEach {
                    printer = LogFilePrinter(encoding: .utf8, fileHeader: "Tests Log", fileName: "Tests.log")

                    printer?.print("Something happened")
                    printer?.print("Something else happened")
                }

                it("should rewrite the content with the header") {
                    try? printer?.clear()

                    expect(printer?.content).to(equal("Tests Log\n"))
                }

                it("should rewrite the file with the header") {
                    try? printer?.clear()

                    expect(printer.flatMap({ printer in
                        return try? String(contentsOfFile: printer.filePath, encoding: .utf8)
                    })).to(equal("Tests Log\n"))
                }
            }

            context("when the header is empty") {
                var printer: LogFilePrinter?

                beforeEach {
                    printer = LogFilePrinter(encoding: .utf8, fileHeader: "", fileName: "Tests.log")
                }

                beforeEach {
                    printer?.print("Something happened")
                    printer?.print("Something else happened")
                }

                it("should rewrite the content with the header") {
                    try? printer?.clear()

                    expect(printer?.content).to(beEmpty())
                }

                it("should rewrite the file with the header") {
                    try? printer?.clear()

                    expect(printer.flatMap({ printer in
                        return try? String(contentsOfFile: printer.filePath, encoding: .utf8)
                    })).to(beEmpty())
                }
            }
        }
    }
}
