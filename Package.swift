// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "Nashi",
    platforms: [.macOS(.v13)],
    products: [
        .library(name: "NashiCore", targets: ["NashiCore"]),
        .executable(name: "Nashi", targets: ["NashiApp"]),
        .executable(name: "nashi-cli", targets: ["NashiCLI"])
    ],
    dependencies: [],
    targets: [
        .target(name: "NashiCore", resources: [.copy("Resources")]),
        .executableTarget(name: "NashiApp", dependencies: ["NashiCore"]),
        .executableTarget(name: "NashiCLI", dependencies: ["NashiCore"]),
        .testTarget(name: "NashiCoreTests", dependencies: ["NashiCore"], resources: [.copy("Fixtures")])
    ],
    swiftLanguageModes: [.v5]
)
