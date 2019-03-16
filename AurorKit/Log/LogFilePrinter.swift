//
//  LogFilePrinter.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 15/02/2019.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

public class LogFilePrinter: LogPrinter {

    // MARK: - Instance Properties

    private var headerContent: String {
        return self.fileHeader.isEmpty ? "" : "\(self.fileHeader)\n"
    }

    // MARK: -

    public let encoding: String.Encoding

    public let fileHeader: String
    public let fileName: String
    public let filePath: String

    public var content: String? {
        return try? String(contentsOfFile: self.filePath, encoding: self.encoding)
    }

    // MARK: - Initializers

    public init?(encoding: String.Encoding = .utf8, fileHeader: String = "", fileName: String) {
        guard let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return nil
        }

        self.encoding = encoding

        self.fileHeader = fileHeader
        self.fileName = fileName
        self.filePath = documentURL.appendingPathComponent(fileName).path

        do {
            try FileManager.default.createDirectory(at: documentURL,
                                                    withIntermediateDirectories: true,
                                                    attributes: nil)

            var isDirectory: ObjCBool = false

            if FileManager.default.fileExists(atPath: self.filePath, isDirectory: &isDirectory) {
                guard !isDirectory.boolValue else {
                    return nil
                }
            }

            try self.clear()
        } catch {
            return nil
        }
    }

    // MARK: - Instance Methods

    public func print(_ line: String) {
        let content = "\(self.content ?? self.headerContent)\(line)\n"

        try? content.write(toFile: self.filePath, atomically: true, encoding: self.encoding)
    }

    public func clear() throws {
        try self.headerContent.write(toFile: self.filePath, atomically: true, encoding: self.encoding)
    }
}
