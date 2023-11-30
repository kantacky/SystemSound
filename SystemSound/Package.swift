// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SystemSound",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "SystemSound", targets: ["SystemSound"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SystemSound"
        ),
        .testTarget(
            name: "SystemSoundTests",
            dependencies: ["SystemSound"]
        ),
    ]
)
