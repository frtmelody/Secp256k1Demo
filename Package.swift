// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Secp256k1Demo",

    platforms: [
      .macOS(.v11),
      .iOS(.v13),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            /* path: "./K1/" */
            url: "https://github.com/frtmelody/K1",
            branch: "main"
        ),
        .package(
            url: "https://github.com/krzyzanowskim/CryptoSwift",
            branch: "main"
            
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "Secp256k1Demo",
            dependencies: [
            "K1",
            "CryptoSwift",
            ]),
        .testTarget(
            name: "Secp256k1DemoTests",
            dependencies: ["Secp256k1Demo"]),
    ]
)
