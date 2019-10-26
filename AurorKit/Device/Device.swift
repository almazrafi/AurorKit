import Foundation

public struct Device {

    // MARK: - Type Properties

    public static var current: Device = {
        var systemInfo = utsname()

        uname(&systemInfo)

        let modelIdentifier = Mirror(reflecting: systemInfo.machine).children.reduce(into: "") { result, child in
            if let byte = child.value as? Int8, byte != 0 {
                result.append(String(UnicodeScalar(UInt8(byte))))
            }
        }

        return Device(modelIdentifier: modelIdentifier)
    }()

    // MARK: - Instance Properties

    public let model: DeviceModel
    public let modelName: String
    public let modelIdentifier: String

    // MARK: - Initializers

    public init(modelIdentifier: String) {
        // swiftlint:disable:previous function_body_length

        switch modelIdentifier {
        case "iPhone5,1", "iPhone5,2":
            model = .iPhone5
            modelName = "iPhone 5"

        case "iPhone5,3", "iPhone5,4":
            model = .iPhone5c
            modelName = "iPhone 5c"

        case "iPhone6,1", "iPhone6,2":
            model = .iPhone5s
            modelName = "iPhone 5s"

        case "iPhone7,2":
            model = .iPhone6
            modelName = "iPhone 6"

        case "iPhone7,1":
            model = .iPhone6Plus
            modelName = "iPhone 6 Plus"

        case "iPhone8,1":
            model = .iPhone6s
            modelName = "iPhone 6s"

        case "iPhone8,2":
            model = .iPhone6sPlus
            modelName = "iPhone 6s Plus"

        case "iPhone9,1", "iPhone9,3":
            model = .iPhone7
            modelName = "iPhone 7"

        case "iPhone9,2", "iPhone9,4":
            model = .iPhone7Plus
            modelName = "iPhone 7 Plus"

        case "iPhone8,4":
            model = .iPhoneSE
            modelName = "iPhone SE"

        case "iPhone10,1", "iPhone10,4":
            model = .iPhone8
            modelName = "iPhone 8"

        case "iPhone10,2", "iPhone10,5":
            model = .iPhone8Plus
            modelName = "iPhone 8 Plus"

        case "iPhone10,3", "iPhone10,6":
            model = .iPhoneX
            modelName = "iPhone X"

        case "iPhone11,2":
            model = .iPhoneXS
            modelName = "iPhone Xs"

        case "iPhone11,4", "iPhone11,6":
            model = .iPhoneXSMax
            modelName = "iPhone Xs Max"

        case "iPhone11,8":
            model = .iPhoneXR
            modelName = "iPhone Xr"

        case "iPhone12,1":
            model = .iPhone11
            modelName = "iPhone 11"

        case "iPhone12,3":
            model = .iPhone11Pro
            modelName = "iPhone 11 Pro"

        case "iPhone12,5":
            model = .iPhone11ProMax
            modelName = "iPhone 11 Pro Max"

        case "iPod5,1":
            model = .iPodTouch5
            modelName = "iPod Touch (5th generation)"

        case "iPod7,1":
            model = .iPodTouch6
            modelName = "iPod Touch (6th generation)"

        case "iPod9,1":
            model = .iPodTouch7
            modelName = "iPod touch (7th generation)"

        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":
            model = .iPad2
            modelName = "iPad 2"

        case "iPad3,1", "iPad3,2", "iPad3,3":
            model = .iPad3
            modelName = "iPad (3rd generation)"

        case "iPad3,4", "iPad3,5", "iPad3,6":
            model = .iPad4
            modelName = "iPad (4th generation)"

        case "iPad4,1", "iPad4,2", "iPad4,3":
            model = .iPadAir
            modelName = "iPad Air"

        case "iPad5,3", "iPad5,4":
            model = .iPadAir2
            modelName = "iPad Air 2"

        case "iPad6,11", "iPad6,12":
            model = .iPad5
            modelName = "iPad (5th generation)"

        case "iPad7,5", "iPad7,6":
            model = .iPad6
            modelName = "iPad (6th generation)"

        case "iPad11,3", "iPad11,4":
            model = .iPadAir3
            modelName = "iPad Air (3rd generation)"

        case "iPad7,11", "iPad7,12":
            model = .iPad7
            modelName = "iPad (7th generation)"

        case "iPad2,5", "iPad2,6", "iPad2,7":
            model = .iPadMini
            modelName = "iPad Mini"

        case "iPad4,4", "iPad4,5", "iPad4,6":
            model = .iPadMini2
            modelName = "iPad Mini 2"

        case "iPad4,7", "iPad4,8", "iPad4,9":
            model = .iPadMini3
            modelName = "iPad Mini 3"

        case "iPad5,1", "iPad5,2":
            model = .iPadMini4
            modelName = "iPad Mini 4"

        case "iPad11,1", "iPad11,2":
            model = .iPadMini5
            modelName = "iPad Mini (5th generation)"

        case "iPad6,3", "iPad6,4":
            model = .iPadPro9Inch
            modelName = "iPad Pro (9.7-inch)"

        case "iPad6,7", "iPad6,8":
            model = .iPadPro12Inch
            modelName = "iPad Pro (12.9-inch)"

        case "iPad7,1", "iPad7,2":
            model = .iPadPro12Inch2
            modelName = "iPad Pro (12.9-inch) (2nd generation)"

        case "iPad7,3", "iPad7,4":
            model = .iPadPro10Inch
            modelName = "iPad Pro (10.5-inch)"

        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":
            model = .iPadPro11Inch
            modelName = "iPad Pro (11-inch)"

        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":
            model = .iPadPro12Inch3
            modelName = "iPad Pro (12.9-inch) (3rd generation)"

        case "Watch1,1":
            model = .watch38mm
            modelName = "Watch (1st generation) 38mm"

        case "Watch1,2":
            model = .watch42mm
            modelName = "Watch (1st generation) 42mm"

        case "Watch2,6":
            model = .watch38mmSeries1
            modelName = "Watch Series 1 38mm"

        case "Watch2,7":
            model = .watch42mmSeries1
            modelName = "Watch Series 1 42mm"

        case "Watch2,3":
            model = .watch38mmSeries2
            modelName = "Watch Series 2 38mm"

        case "Watch2,4":
            model = .watch42mmSeries2
            modelName = "Watch Series 2 42mm"

        case "Watch3,1", "Watch3,3":
            model = .watch38mmSeries3
            modelName = "Watch Series 3 38mm"

        case "Watch3,2", "Watch3,4":
            model = .watch42mmSeries3
            modelName = "Watch Series 3 42mm"

        case "Watch4,1", "Watch4,3":
            model = .watch40mmSeries4
            modelName = "Watch Series 4 40mm"

        case "Watch4,2", "Watch4,4":
            model = .watch44mmSeries4
            modelName = "Watch Series 4 44mm"

        case "Watch5,1", "Watch5,3":
            model = .watch40mmSeries5
            modelName = "Watch Series 5 40mm"

        case "Watch5,2", "Watch5,4":
            model = .watch44mmSeries5
            modelName = "Watch Series 5 44mm"

        case "AppleTV5,3":
            model = .tv4
            modelName = "TV HD"

        case "AppleTV6,2":
            model = .tv4K
            modelName = "TV 4K"

        case "AudioAccessory1,1":
            model = .homePod
            modelName = "HomePod"

        case "i386", "x86_64":
            model = .simulator
            modelName = "Simulator"

        default:
            model = .unknown
            modelName = "Unknown"
        }

        self.modelIdentifier = modelIdentifier
    }
}
