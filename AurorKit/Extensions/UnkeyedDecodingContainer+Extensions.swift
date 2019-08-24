import Foundation

extension UnkeyedDecodingContainer {

    // MARK: - Instance Methods

    public mutating func decode<T: Decodable>(_ type: T.Type = T.self) throws -> T {
        return try decode(type)
    }

    public mutating func decodeIfPresent<T: Decodable>(_ type: T.Type = T.self) throws -> T? {
        return try decodeIfPresent(type)
    }
}
