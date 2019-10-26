// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "AurorKit",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12),
        .watchOS(.v3),
        .tvOS(.v10)
    ],
    products: [
        .library(name: "AurorKit", targets: ["AurorKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "2.1.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "8.0.2")
    ],
    targets: [
        .target(
            name: "AurorKit",
            dependencies: [],
            path: "AurorKit"
        ),
        .testTarget(
            name: "AurorKitTests",
            dependencies: ["AurorKit", "Quick", "Nimble"],
            path: "AurorKitTests"
        )
    ],
    swiftLanguageVersions: [.v5]
)
