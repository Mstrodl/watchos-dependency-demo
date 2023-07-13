// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExternalDep",
    platforms: [
        .iOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ExternalDep",
            targets: ["ExternalDep"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Mstrodl/dd-sdk-ios.git", branch: "fix/mstrodl/visionos-support"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ExternalDep",
            dependencies: [
                .product(name: "Datadog", package: "dd-sdk-ios", condition: .when(platforms: [.iOS])),
                .product(name: "DatadogCrashReporting", package: "dd-sdk-ios", condition: .when(platforms: [.iOS])),
            ]
        ),
    ]
)
