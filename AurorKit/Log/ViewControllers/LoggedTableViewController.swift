#if canImport(UIKit)
import UIKit

open class LoggedTableViewController: UITableViewController {

    // MARK: - Initializers

    deinit {
        Log.high("deinit", from: self)
    }

    // MARK: - Instance Methods

    open override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        Log.high("didReceiveMemoryWarning()", from: self)
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        Log.high("viewDidLoad()", from: self)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        Log.high("viewWillAppear(animated: \(animated))", from: self)
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Log.high("viewDidAppear(animated: \(animated))", from: self)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        Log.high("viewWillDisappear(animated: \(animated))", from: self)
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        Log.high("viewDidDisappear(animated: \(animated))", from: self)
    }
}
#endif
