// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "aoc2025",
    targets: [
        .target(
            name: "day1",
            dependencies: ["utils"],
            resources: [.process("Resources")],
        ),
        .testTarget(
            name: "day1Tests",
            dependencies: [
                "day1",
            ],
        ),
        .target(
            name: "day2",
            dependencies: ["utils"],
            resources: [.process("Resources")],
        ),
        .testTarget(
            name: "day2Tests",
            dependencies: [
                "day2",
            ],
        ),
        .target(
            name: "day3",
            dependencies: ["utils"],
            resources: [.process("Resources")],
        ),
        .testTarget(
            name: "day3Tests",
            dependencies: [
                "day3",
            ],
        ),
        .target(name: "utils"),
    ],
)
