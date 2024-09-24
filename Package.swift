// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "H4X0R-News-iOS",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "H4X0R-News-iOS",
            targets: ["H4X0R-News-iOS"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "H4X0R-News-iOS"),
        .testTarget(
            name: "H4X0R-News-iOSTests",
            dependencies: ["H4X0R-News-iOS"]),
    ]
)
