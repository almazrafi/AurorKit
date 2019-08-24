import UIKit

import Quick
import Nimble

@testable import AurorKit

class UIImageExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".alignmentRect") {
            context("when image has zero size") {
                var image: UIImage!

                beforeEach {
                    image = UIImage()
                }

                it("should return a zero rectangle") {
                    expect(image.alignmentRect).to(equal(.zero))
                }

                it("should return a zero rectangle") {
                    let image = image.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))

                    expect(image.alignmentRect).to(equal(.zero))
                }

                it("should return the correct rectangle") {
                    let image = image.withAlignmentRectInsets(UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4))

                    expect(image.alignmentRect).to(equal(CGRect(x: 2, y: 1, width: -6, height: -4)))
                }

                it("should return the correct rectangle") {
                    let image = image.withAlignmentRectInsets(UIEdgeInsets(top: -1, left: -2, bottom: -3, right: -4))

                    expect(image.alignmentRect).to(equal(CGRect(x: -2, y: -1, width: 6, height: 4)))
                }
            }

            context("when image has non-zero size") {
                var image: UIImage!

                beforeEach {
                    image = UIImage().scaled(to: CGSize(width: 123, height: 456))
                }

                it("should return the correct rectangle") {
                    expect(image.alignmentRect).to(equal(CGRect(x: 0, y: 0, width: 123, height: 456)))
                }

                it("should return the correct rectangle") {
                    let image = image.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))

                    expect(image.alignmentRect).to(equal(CGRect(x: 0, y: 0, width: 123, height: 456)))
                }

                it("should return the correct rectangle") {
                    let image = image.withAlignmentRectInsets(UIEdgeInsets(top: 1, left: 2, bottom: 3, right: 4))

                    expect(image.alignmentRect).to(equal(CGRect(x: 2, y: 1, width: 117, height: 452)))
                }

                it("should return the correct rectangle") {
                    let image = image.withAlignmentRectInsets(UIEdgeInsets(top: -1, left: -2, bottom: -3, right: -4))

                    expect(image.alignmentRect).to(equal(CGRect(x: -2, y: -1, width: 129, height: 460)))
                }
            }
        }

        describe(".scaled(to:)") {
            it("should return nil") {
                let image = UIImage().scaled(to: CGSize(width: 0, height: 0))

                expect(image).to(beNil())
            }

            it("should return nil") {
                let image = UIImage().scaled(to: CGSize(width: 123, height: 0))

                expect(image).to(beNil())
            }

            it("should return nil") {
                let image = UIImage().scaled(to: CGSize(width: 0, height: 123))

                expect(image).to(beNil())
            }

            it("should return a properly scaled image") {
                let image = UIImage().scaled(to: CGSize(width: 123, height: 456))

                expect(image?.size).to(equal(CGSize(width: 123, height: 456)))
            }
        }

        describe(".scaledToWidth(_:)") {
            it("should return nil") {
                let image = UIImage().scaledToWidth(0.0)

                expect(image).to(beNil())
            }

            it("should return a properly scaled image") {
                let image = UIImage().scaledToWidth(123)

                expect(image?.size).to(equal(CGSize(width: 123, height: 123)))
            }

            it("should return nil") {
                let image = UIImage().scaled(to: CGSize(width: 12, height: 34))?.scaledToWidth(0)

                expect(image).to(beNil())
            }

            it("should return a properly scaled image") {
                let image = UIImage().scaled(to: CGSize(width: 12, height: 34))?.scaledToWidth(24)

                expect(image?.size).to(equal(CGSize(width: 24, height: 68)))
            }
        }

        describe(".scaledToHeight(_:)") {
            it("should return nil") {
                let image = UIImage().scaledToHeight(0.0)

                expect(image).to(beNil())
            }

            it("should return a properly scaled image") {
                let image = UIImage().scaledToHeight(123)

                expect(image?.size).to(equal(CGSize(width: 123, height: 123)))
            }

            it("should return nil") {
                let image = UIImage().scaled(to: CGSize(width: 12, height: 34))?.scaledToHeight(0)

                expect(image).to(beNil())
            }

            it("should return a properly scaled image") {
                let image = UIImage().scaled(to: CGSize(width: 12, height: 34))?.scaledToHeight(17)

                expect(image?.size).to(equal(CGSize(width: 6, height: 17)))
            }
        }
    }
}
