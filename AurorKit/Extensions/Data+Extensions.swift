import Foundation

extension Data {

    // MARK: - Instance Properties

    public var hexEncoded: String {
        return reduce("") { result, byte in
            return result + String(format: "%02hhx", byte)
        }
    }
}
