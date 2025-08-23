// swift-tools-version: 5.7
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
            url: "https://placeholder-url.com/ADScratchKit.xcframework.zip",
            checksum: "0000000000000000000000000000000000000000000000000000000000000000"
        )
    ]
)