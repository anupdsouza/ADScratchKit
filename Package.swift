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
            url: "https://github.com/anupdsouza/ADScratchKit/releases/download/0.0.1/ADScratchKit.xcframework.zip",
            checksum: "d914d82eab734c15978d9c4f40dedda2a86204718a382ead752cc06323a4cf40"
        )
    ]
)
