// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Architecture",
  platforms: [
    .iOS(.v17),
  ],
  products: [
    .library(
      name: "Architecture",
      targets: ["Architecture"]),
  ],
  dependencies: [
    .package(
      url: "https://github.com/pointfreeco/swift-composable-architecture",
      .upToNextMajor(from: "1.10.4")),
    .package(
      url: "https://github.com/interactord/LinkNavigator",
      .upToNextMajor(from: "1.2.2")),
    .package(
      url: "https://github.com/kean/Pulse",
      .upToNextMajor(from: "4.1.1")),
    .package(
      url: "https://github.com/kean/PulseLogHandler",
      .upToNextMajor(from: "4.0.1")),
  ],
  targets: [
    .target(
      name: "Architecture",
      dependencies: [
        "LinkNavigator",
        .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
        .product(name: "Pulse", package: "Pulse"),
        .product(name: "PulseLogHandler", package: "PulseLogHandler"),
      ]
    ),
    .testTarget(
      name: "ArchitectureTests",
      dependencies: ["Architecture"]),
  ])
