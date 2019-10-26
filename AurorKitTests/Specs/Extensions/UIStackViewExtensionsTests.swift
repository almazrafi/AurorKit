#if canImport(UIKit) && !os(watchOS)
import UIKit
import Quick
import Nimble

@testable import AurorKit

class UIStackViewExtensionsTests: QuickSpec {

    // MARK: - Instance Methods

    override func spec() {
        describe(".init(axis:frame:)") {
            it("should initialize properly") {
                let stackView = UIStackView(
                    axis: .vertical,
                    frame: CGRect(x: 1.2, y: 3.4, width: 5.6, height: 7.8)
                )

                expect(stackView.axis).to(equal(.vertical))
                expect(stackView.frame).to(beCloseTo(CGRect(x: 1.2, y: 3.4, width: 5.6, height: 7.8)))
            }
        }

        context("when it is initialized") {
            var firstView: UIView!
            var secondView: UIView!

            var stackView: UIStackView!

            beforeEach {
                firstView = UIView()
                secondView = UIView()
                stackView = UIStackView(arrangedSubviews: [firstView, secondView])
            }

            describe(".insertArrangedSubview(:after:)") {
                it("should add the new view at the end if the provided view is not in the stack") {
                    let newView = UIView()

                    stackView.insertArrangedSubview(newView, after: UIView())

                    expect(stackView.arrangedSubviews.last).to(beIdenticalTo(newView))
                }

                it("should insert the new view after the provided view") {
                    let newView = UIView()

                    stackView.insertArrangedSubview(newView, after: firstView)

                    expect(stackView.arrangedSubviews.count).to(equal(3))
                    expect(stackView.arrangedSubviews.firstIndex(of: newView)).to(equal(1))
                }
            }

            describe(".insertArrangedSubview(:before:)") {
                it("should add the new view at the end if the provided view is not in the stack") {
                    let newView = UIView()

                    stackView.insertArrangedSubview(newView, before: UIView())

                    expect(stackView.arrangedSubviews.last).to(beIdenticalTo(newView))
                }

                it("should insert the new view before the provided view") {
                    let newView = UIView()

                    stackView.insertArrangedSubview(newView, before: secondView)

                    expect(stackView.arrangedSubviews.count).to(equal(3))
                    expect(stackView.arrangedSubviews.firstIndex(of: newView)).to(equal(1))
                }
            }
        }
    }
}
#endif
