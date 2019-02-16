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

    public let encoding: String.Encoding

    public let fileHeader: String
    public let fileName: String
    public let filePath: String

    public var content: String? {
        return try? String(contentsOfFile: self.filePath, encoding: self.encoding)
    }

    // MARK: - Initializers

    public init?(encoding: String.Encoding = .utf8, fileHeader: String = "", fileName: String) {
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

        self.encoding = encoding

        self.fileHeader = fileHeader
        self.fileName = fileName
        self.filePath = documentURL?.appendingPathComponent(fileName).path ?? fileName

        do {
            if let documentURL = documentURL {
                try FileManager.default.createDirectory(at: documentURL,
                                                        withIntermediateDirectories: true,
                                                        attributes: nil)
            }

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
        let content = "\(self.content ?? self.fileHeader)\(line)\n"

        try? content.write(toFile: self.filePath, atomically: true, encoding: self.encoding)
    }

    public func clear() throws {
        let content = self.fileHeader.isEmpty ? "" : "\(self.fileHeader)\n"

        try content.write(toFile: self.filePath, atomically: true, encoding: self.encoding)
    }
}
