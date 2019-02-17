//
//  Log.swift
//  AurorKit
//
//  Created by Almaz Ibragimov on 01/01/2018.
//  Copyright © 2019 Aurors. All rights reserved.
//

import Foundation

public enum Log {

    // MARK: - Nested Types

    private enum Constants {

        // MARK: - Type Properties

        static let defaultDateFormat = "[HH:mm:ss.SSSS]"

        static let lowLayerLabel = "<*  >"
        static let mediumLayerLabel = "<** >"
        static let highLayerLabel = "<***>"
        static let extraLayerLabel = "<--->"
    }

    // MARK: - Type Properties

    private static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = Constants.defaultDateFormat

        return dateFormatter
    }()

    // MARK: -

    public private(set) static var printers: [LogPrinter] = [LogConsolePrinter.shared]

    public static var dateFormat: String {
        get {
            return Log.dateFormatter.dateFormat
        }

        set {
            Log.dateFormatter.dateFormat = newValue
        }
    }

    // MARK: - Type Methods

    private static func print(layer: @autoclosure () -> String,
                              text: @autoclosure () -> String,
                              sender: @autoclosure () -> Any?,
                              date: @autoclosure () -> Date) {
        #if DEBUG || LOGGING
            let body = sender().map({ "\(String(describing: type(of: $0))): \(text())" }) ?? text()
            let line = "\(self.dateFormatter.string(from: date())) \(layer()) \(body)"

            for printer in printers {
                printer.print(line)
            }
        #endif
    }

    // MARK: -

    public static func registerPrinter(_ printer: LogPrinter) {
        if !self.printers.contains(where: { $0 === printer }) {
            self.printers.append(printer)
        }
    }

    public static func unregisterPrinter(_ printer: LogPrinter) {
        self.printers.removeAll(where: { $0 === printer })
    }

    public static func low(_ text: @autoclosure () -> String,
                           from sender: @autoclosure () -> Any? = nil,
                           date: @autoclosure () -> Date = Date()) {
        self.print(layer: Constants.lowLayerLabel, text: text, sender: sender, date: date)
    }

    public static func medium(_ text: @autoclosure () -> String,
                              from sender: @autoclosure () -> Any? = nil,
                              date: @autoclosure () -> Date = Date()) {
        self.print(layer: Constants.mediumLayerLabel, text: text, sender: sender, date: date)
    }

    public static func high(_ text: @autoclosure () -> String,
                            from sender: @autoclosure () -> Any? = nil,
                            date: @autoclosure () -> Date = Date()) {
        self.print(layer: Constants.highLayerLabel, text: text, sender: sender, date: date)
    }

    public static func extra(_ text: @autoclosure () -> String,
                             from sender: @autoclosure () -> Any? = nil,
                             date: @autoclosure () -> Date = Date()) {
        self.print(layer: Constants.extraLayerLabel, text: text, sender: sender, date: date)
    }
}
