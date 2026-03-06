// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GameStub",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "runner", targets: ["Runner"]),
        .executable(name: "launcher", targets: ["Launcher"])
    ],
    targets: [
        .executableTarget(name: "Runner"),
        .executableTarget(name: "Launcher")
    ]
)
