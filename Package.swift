// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ADScratchKit",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "ADScratchKit", targets: ["ADScratchKit"]),
    ],
    targets: [
        .binaryTarget(
            name: "ADScratchKit",
            url: "https://github.com/anupdsouza/ADScratchKit/releases/download/0.0.2/ADScratchKit.xcframework.zip",
            checksum: "1d2af34664dffa8d4c3e9f9d8be0c9f4debf46a59ce062e2a42a29afd9544c30"
        )
    ]
)
