import Foundation

public class LogConsolePrinter: LogPrinter {

    // MARK: - Type Properties

    public static let shared = LogConsolePrinter()

    // MARK: - Initializers

    private init() { }

    // MARK: - Instance Methods

    public func print(_ line: String) {
        Swift.print(line)
    }
}
