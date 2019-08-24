import Foundation

extension DateFormatter {

    // MARK: - Initializers

    public convenience init(dateFormat: String) {
        self.init()

        self.dateFormat = dateFormat
    }
}
