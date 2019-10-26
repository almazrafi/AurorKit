import Foundation
import Quick
import Nimble

@testable import AurorKit

class DateFormatterExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".init(dateFormat:)") {
            it("should return an empty date format") {
                let dateFormatter = DateFormatter(dateFormat: "")

                expect(dateFormatter.dateFormat).to(beEmpty())
            }

            it("should return the correct date format") {
                let dateFormatter = DateFormatter(dateFormat: "HH:mm:ss.SSSS")

                expect(dateFormatter.dateFormat).to(equal("HH:mm:ss.SSSS"))
            }
        }
    }
}
