// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VCForm",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(name: "VCForm", targets: ["VCForm"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/avreolko/VCReorderableStackView.git",
            .branch("master")
        )
    ],
    targets: [
        .target(
            name: "VCForm",
            dependencies: ["VCReorderableStackView"],
            path: "Sources"
        ),
        .testTarget(
            name: "VCFormTests",
            dependencies: ["VCForm"],
            path: "Tests"
        )
    ]
)
