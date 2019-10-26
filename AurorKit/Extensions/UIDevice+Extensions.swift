#if canImport(UIKit) && !os(watchOS)
import UIKit

extension UIDevice {

    // MARK: - Instance Methods

    public var modelIdentifier: String {
        var systemInfo = utsname()

        uname(&systemInfo)

        let identifier = Mirror(reflecting: systemInfo.machine).children.reduce("") { result, child in
            guard let byte = child.value as? Int8, byte != 0 else {
                return result
            }

            return result + String(UnicodeScalar(UInt8(byte)))
        }

        return identifier
    }

    public var modelName: String {
        let modelIdentifierMap: [String: String] = [
            "i386": "simulator", "x86_64": "simulator",

            "iPod5,1": "iPod Touch (5th generation)",
            "iPod7,1": "iPod Touch (6th generation)",
            "iPod9,1": "iPod touch (7th generation)",

            "iPad2,1": "iPad 2",
            "iPad2,2": "iPad 2",
            "iPad2,3": "iPad 2",
            "iPad2,4": "iPad 2",

            "iPad3,1": "iPad 3",
            "iPad3,2": "iPad 3",
            "iPad3,3": "iPad 3",
            "iPad3,4": "iPad 4",
            "iPad3,5": "iPad 4",
            "iPad3,6": "iPad 4",

            "iPad6,11": "iPad 5", "iPad6,12": "iPad 5",
            "iPad7,5": "iPad 6", "iPad7,6": "iPad 6",
            "iPad7,11": "iPad (7th generation)", "iPad7,12": "iPad (7th generation)",

            "iPad4,1": "iPad Air", "iPad4,2": "iPad Air", "iPad4,3": "iPad Air",
            "iPad5,3": "iPad Air (2nd generation)", "iPad5,4": "iPad Air (2nd generation)",
            "iPad11,3": "iPad Air (3rd generation)", "iPad11,4": "iPad Air (3rd generation)",

            "iPad2,5": "iPad Mini", "iPad2,6": "iPad Mini", "iPad2,7": "iPad Mini",
            "iPad4,4": "iPad Mini 2", "iPad4,5": "iPad Mini 2", "iPad4,6": "iPad Mini 2",
            "iPad4,7": "iPad Mini 3", "iPad4,8": "iPad Mini 3", "iPad4,9": "iPad Mini 3",
            "iPad5,1": "iPad Mini 4", "iPad5,2": "iPad Mini 4",
            "iPad11,1": "iPad Mini (5th generation)", "iPad11,2": "iPad Mini (5th generation)",

            "iPad6,3": "iPad Pro (9.7-inch)", "iPad6,4": "iPad Pro (9.7-inch)",
            "iPad6,7": "iPad Pro (12.9-inch)", "iPad6,8": "iPad Pro (12.9-inch)",
            "iPad7,1": "iPad Pro (12.9-inch) (2nd generation)", "iPad7,2": "iPad Pro (12.9-inch) (2nd generation)",
            "iPad7,3": "iPad Pro (10.5-inch)", "iPad7,4": "iPad Pro (10.5-inch)",
            "iPad8,1": "iPad Pro (11-inch)", "iPad8,2": "iPad Pro (11-inch)",
            "iPad8,3": "iPad Pro (11-inch)", "iPad8,4": "iPad Pro (11-inch)",
            "iPad8,5": "iPad Pro (12.9-inch) (3rd generation)", "iPad8,6": "iPad Pro (12.9-inch) (3rd generation)",
            "iPad8,7": "iPad Pro (12.9-inch) (3rd generation)", "iPad8,8": "iPad Pro (12.9-inch) (3rd generation)",

            "iPhone5,1": "iPhone 5", "iPhone5,2": "iPhone 5",
            "iPhone5,3": "iPhone 5c", "iPhone5,4": "iPhone 5c",
            "iPhone6,1": "iPhone 5s", "iPhone6,2": "iPhone 5s",
            "iPhone7,2": "iPhone 6",
            "iPhone7,1": "iPhone 6 Plus",
            "iPhone8,1": "iPhone 6s",
            "iPhone8,2": "iPhone 6s Plus",
            "iPhone8,4": "iPhone SE",
            "iPhone9,1": "iPhone 7", "iPhone9,3": "iPhone 7",
            "iPhone9,2": "iPhone 7 Plus", "iPhone9,4": "iPhone 7 Plus",
            "iPhone10,1": "iPhone 8", "iPhone10,4": "iPhone 8",
            "iPhone10,2": "iPhone 8 Plus", "iPhone10,5": "iPhone 8 Plus",
            "iPhone10,3": "iPhone X", "iPhone10,6": "iPhone X",
            "iPhone11,2": "iPhone Xs",
            "iPhone11,4": "iPhone Xs Max", "iPhone11,6": "iPhone Xs Max",
            "iPhone11,8": "iPhone Xr",
            "iPhone12,1": "iPhone 11",
            "iPhone12,3": "iPhone 11 Pro",
            "iPhone12,5": "iPhone 11 Pro Max",

            "AudioAccessory1,1": "HomePod",

            "AppleTV5,3": "Apple TV 4",
            "AppleTV6,2": "Apple TV 4K",

            "Watch1,1": "Apple Watch (1st generation) 38mm",
            "Watch1,2": "Apple Watch (1st generation) 42mm",
            "Watch2,6": "Apple Watch Series 1 38mm",
            "Watch2,7": "Apple Watch Series 1 42mm",
            "Watch2,3": "Apple Watch Series 2 38mm",
            "Watch2,4": "Apple Watch Series 2 42mm",
            "Watch3,1": "Apple Watch Series 3 38mm",
            "Watch3,3": "Apple Watch Series 3 38mm",
            "Watch3,2": "Apple Watch Series 3 42mm",
            "Watch3,4": "Apple Watch Series 3 42mm",
            "Watch4,1": "Apple Watch Series 4 40mm",
            "Watch4,3": "Apple Watch Series 4 40mm",
            "Watch4,2": "Apple Watch Series 4 44mm",
            "Watch4,4": "Apple Watch Series 4 44mm",
            "Watch5,1": "Apple Watch Series 5 40mm",
            "Watch5,3": "Apple Watch Series 5 40mm",
            "Watch5,2": "Apple Watch Series 5 44mm",
            "Watch5,4": "Apple Watch Series 5 44mm"
        ]

        return modelIdentifierMap[modelIdentifier] ?? "Unknown"
    }
}
#endif
