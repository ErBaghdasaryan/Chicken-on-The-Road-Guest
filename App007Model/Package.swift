// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "App007Model",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "App007Model",
            targets: ["App007Model"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "App007Model"),
        .testTarget(
            name: "App007ModelTests",
            dependencies: ["App007Model"]
        ),
    ]
)
