// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.
// https://github.com/apple/swift-package-manager/blob/master/Documentation/PackageDescription.md

import PackageDescription

let package = Package(
    name: "xcvtool",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .executable(
            name: "xcvtool",
            targets: ["xcvtool"]),
        .library(
            name: "XcvtoolKit",
            type: .dynamic,
            targets: ["XcvtoolKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tuist/XcodeProj", .upToNextMajor(from: "7.8.0")),
    ],
    targets: [
        .target(
            name: "xcvtool",
            dependencies: ["XcvtoolKit"],
            path: "xcvtool"),
        .target(
            name: "XcvtoolKit",
            dependencies: ["XcodeProj"],
            path: "XcvtoolKit"),
        .testTarget(
            name: "XcvtoolKitTests",
            dependencies: ["XcvtoolKit"],
            path: "XcvtoolKitTests"),
    ],
    swiftLanguageVersions: [.v5]
)
