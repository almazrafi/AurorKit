import Foundation

public class LogFilePrinter: LogPrinter {

    // MARK: - Instance Properties

    private var headerContent: String {
        return fileHeader.isEmpty ? "" : "\(fileHeader)\n"
    }

    // MARK: -

    public let encoding: String.Encoding

    public let fileHeader: String
    public let fileName: String
    public let filePath: String

    public var content: String? {
        return try? String(contentsOfFile: filePath, encoding: encoding)
    }

    // MARK: - Initializers

    public init?(encoding: String.Encoding = .utf8, fileHeader: String = "", fileName: String) {
        let fileManager = FileManager.default

        guard let documentURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }

        self.encoding = encoding

        self.fileHeader = fileHeader
        self.fileName = fileName
        self.filePath = documentURL.appendingPathComponent(fileName).path

        do {
            try fileManager.createDirectory(
                at: documentURL,
                withIntermediateDirectories: true,
                attributes: nil
            )

            var isDirectory: ObjCBool = false

            if fileManager.fileExists(atPath: filePath, isDirectory: &isDirectory), isDirectory.boolValue {
                return nil
            }

            try clear()
        } catch {
            return nil
        }
    }

    // MARK: - Instance Methods

    public func print(_ line: String) {
        try? "\(content ?? headerContent)\(line)\n".write(toFile: filePath, atomically: true, encoding: encoding)
    }

    public func clear() throws {
        try headerContent.write(toFile: filePath, atomically: true, encoding: encoding)
    }
}
