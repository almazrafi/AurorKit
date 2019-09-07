import Foundation

extension String {

    // MARK: - Instance Methods

    public func localized(tableName: String? = nil, comment: String = "") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: Bundle.main, value: "", comment: comment)
    }

    public func suffix(from index: Int) -> String {
        return String(suffix(from: self.index(startIndex, offsetBy: max(0, min(index, count)))))
    }
}
