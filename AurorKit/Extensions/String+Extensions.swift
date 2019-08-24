import Foundation

extension String {

    // MARK: - Instance Methods

    public func localized(tableName: String? = nil, comment: String = "") -> String {
        return NSLocalizedString(self, tableName: tableName, bundle: Bundle.main, value: "", comment: comment)
    }

    public func prefix(count: Int) -> String {
        return ((self.count > count) ? String(self[..<index(startIndex, offsetBy: max(count, 0))]) : self)
    }

    public func suffix(from index: Int) -> String {
        return ((count > index) ? String(self[self.index(startIndex, offsetBy: max(index, 0))...]) : "")
    }
}
