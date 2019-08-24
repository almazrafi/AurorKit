import Foundation
import AurorKit

class MockLogPrinter: LogPrinter {

    // MARK: - Instance Properties

    private(set) var printCallCount = 0
    private(set) var printArguments: String?

    // MARK: - Instance Methods

    func print(_ line: String) {
        printCallCount += 1
        printArguments = line
    }
}
