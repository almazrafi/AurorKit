import Foundation

extension KeyedDecodingContainerProtocol {

    // MARK: - Instance Methods

    public func decode<T: Decodable>(_ type: T.Type = T.self, forKey key: Key) throws -> T {
        return try decode(type, forKey: key)
    }

    public func decodeIfPresent<T: Decodable>(_ type: T.Type = T.self, forKey key: Self.Key) throws -> T? {
        return try decodeIfPresent(type, forKey: key)
    }
}
