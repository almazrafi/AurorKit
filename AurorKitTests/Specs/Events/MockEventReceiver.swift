import Foundation

class MockEventReceiver<T> {

    // MARK: - Instance Properties

    private(set) var handlerCallCount = 0
    private(set) var handlerArguments: T?

    private(set) lazy var handler: (T) -> Void = { [unowned self] data in
        self.handlerCallCount += 1
        self.handlerArguments = data
    }
}
