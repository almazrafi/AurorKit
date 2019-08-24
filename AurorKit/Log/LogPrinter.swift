import Foundation

public protocol LogPrinter: AnyObject {

    // MARK: - Instance Methods

    func print(_ line: String)
}
