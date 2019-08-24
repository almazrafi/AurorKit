import Foundation

extension Optional {

    // MARK: - Instance Properties

    public var isNil: Bool {
        return self == nil
    }
}

// MARK: - where Wrapped: Collection

extension Optional where Wrapped: Collection {

    // MARK: - Instance Properties

    public var isEmptyOrNil: Bool {
        return self?.isEmpty ?? true
    }
}
