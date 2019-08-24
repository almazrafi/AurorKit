import UIKit

extension UIApplication {

    // MARK: - Instance Methods

    public func call(phoneNumber: String, completion: ((_ successfully: Bool) -> Void)?) {
        guard let phoneNumberURL = URL(string: "tel:\(phoneNumber)"), canOpenURL(phoneNumberURL) else {
            completion?(false)

            return
        }

        DispatchQueue.main.async {
            self.open(phoneNumberURL, options: [:], completionHandler: completion)
        }
    }
}
