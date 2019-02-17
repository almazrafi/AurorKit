//
//  LoggedTabBarControllerTests.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 16/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import UIKit

import Quick
import Nimble

@testable import AurorKit

class LoggedTabBarControllerTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        var printer: LogPrinterMock!

        beforeEach {
            printer = LogPrinterMock()

            Log.printers.forEach({ printer in
                Log.unregisterPrinter(printer)
            })

            Log.registerPrinter(printer)
        }

        describe(".deinit") {
            it("should call the printer with correct parameters") {
                DispatchQueue.main.async {
                    _ = LoggedTabBarController()
                }

                expect(printer.printCallCount).toEventually(beGreaterThan(0))
                expect(printer.printParameters).toEventually(endWith("deinit"))
            }
        }

        context("when it is initialized") {
            var viewController: LoggedTabBarController!

            beforeSuite {
                viewController = LoggedTabBarController()
            }

            describe(".didReceiveMemoryWarning()") {
                it("should call the printer with correct parameters") {
                    viewController.didReceiveMemoryWarning()

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printParameters).to(endWith("didReceiveMemoryWarning()"))
                }
            }

            describe(".viewDidLoad()") {
                it("should call the printer with correct parameters") {
                    viewController.viewDidLoad()

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printParameters).to(endWith("viewDidLoad()"))
                }
            }

            describe(".viewWillAppear(:)") {
                it("should call the printer with correct parameters") {
                    viewController.viewWillAppear(true)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printParameters).to(endWith("viewWillAppear(animated: true)"))
                }

                it("should call the printer with correct parameters") {
                    viewController.viewWillAppear(false)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printParameters).to(endWith("viewWillAppear(animated: false)"))
                }
            }

            describe(".viewDidAppear(:)") {
                it("should call the printer with correct parameters") {
                    viewController.viewDidAppear(true)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printParameters).to(endWith("viewDidAppear(animated: true)"))
                }

                it("should call the printer with correct parameters") {
                    viewController.viewDidAppear(false)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printParameters).to(endWith("viewDidAppear(animated: false)"))
                }
            }

            describe(".viewWillDisappear(:)") {
                it("should call the printer with correct parameters") {
                    viewController.viewWillDisappear(true)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printParameters).to(endWith("viewWillDisappear(animated: true)"))
                }

                it("should call the printer with correct parameters") {
                    viewController.viewWillDisappear(false)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printParameters).to(endWith("viewWillDisappear(animated: false)"))
                }
            }

            describe(".viewDidDisappear(:)") {
                it("should call the printer with correct parameters") {
                    viewController.viewDidDisappear(true)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printParameters).to(endWith("viewDidDisappear(animated: true)"))
                }

                it("should call the printer with correct parameters") {
                    viewController.viewDidDisappear(false)

                    expect(printer.printCallCount).to(beGreaterThan(0))
                    expect(printer.printParameters).to(endWith("viewDidDisappear(animated: false)"))
                }
            }
        }
    }
}
