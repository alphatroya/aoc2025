// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "aoc2025",
    products: [
        .executable(name: "aoc2025", targets: ["aoc2025"]),
        .library(name: "day1", targets: ["day1"]),
    ],
    targets: [
        .executableTarget(
            name: "aoc2025",
            dependencies: [
                "day1",
            ],
        ),
        .target(
            name: "day1",
            dependencies: ["utils"],
            resources: [.process("Resources/input.txt")],
        ),
        .testTarget(
            name: "day1Tests",
            dependencies: [
                "day1",
            ],
        ),
        .target(name: "utils"),
    ],
)
