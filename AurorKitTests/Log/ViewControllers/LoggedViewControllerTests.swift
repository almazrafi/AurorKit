//
//  LoggedViewControllerTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 16/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

import Quick
import Nimble

@testable import AurorKit

class LoggedViewControllerTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var printer: MockLogPrinter!

        beforeEach {
            printer = MockLogPrinter()

            Log.printers.forEach({ printer in
                Log.unregisterPrinter(printer)
            })

            Log.registerPrinter(printer)
        }

        describe(".deinit") {
            it("should call the printer with correct arguments") {
                DispatchQueue.main.async {
                    _ = LoggedViewController()
                }

                expect(printer.printCallCount).toEventually(beGreaterThan(0))
                expect(printer.printArguments).toEventually(endWith("deinit"))
            }
        }

        context("when it is initialized") {
            var viewController: LoggedViewController!

            beforeSuite {
                viewController = LoggedViewController()
            }

            describe(".didReceiveMemoryWarning()") {
                it("should call the printer with correct arguments") {
                    viewController.didReceiveMemoryWarning()

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printArguments).to(endWith("didReceiveMemoryWarning()"))
                }
            }

            describe(".viewDidLoad()") {
                it("should call the printer with correct arguments") {
                    viewController.viewDidLoad()

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printArguments).to(endWith("viewDidLoad()"))
                }
            }

            describe(".viewWillAppear(_:)") {
                it("should call the printer with correct arguments") {
                    viewController.viewWillAppear(true)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printArguments).to(endWith("viewWillAppear(animated: true)"))
                }

                it("should call the printer with correct arguments") {
                    viewController.viewWillAppear(false)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printArguments).to(endWith("viewWillAppear(animated: false)"))
                }
            }

            describe(".viewDidAppear(_:)") {
                it("should call the printer with correct arguments") {
                    viewController.viewDidAppear(true)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printArguments).to(endWith("viewDidAppear(animated: true)"))
                }

                it("should call the printer with correct arguments") {
                    viewController.viewDidAppear(false)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printArguments).to(endWith("viewDidAppear(animated: false)"))
                }
            }

            describe(".viewWillDisappear(_:)") {
                it("should call the printer with correct arguments") {
                    viewController.viewWillDisappear(true)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printArguments).to(endWith("viewWillDisappear(animated: true)"))
                }

                it("should call the printer with correct arguments") {
                    viewController.viewWillDisappear(false)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printArguments).to(endWith("viewWillDisappear(animated: false)"))
                }
            }

            describe(".viewDidDisappear(_:)") {
                it("should call the printer with correct arguments") {
                    viewController.viewDidDisappear(true)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printArguments).to(endWith("viewDidDisappear(animated: true)"))
                }

                it("should call the printer with correct arguments") {
                    viewController.viewDidDisappear(false)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printArguments).to(endWith("viewDidDisappear(animated: false)"))
                }
            }
        }
    }
}
