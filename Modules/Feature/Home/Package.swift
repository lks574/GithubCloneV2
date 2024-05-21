// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Home",
  platforms: [
    .iOS(.v17),
  ],
  products: [
    .library(
      name: "Home",
      targets: ["Home"]),
  ],
  dependencies: [
    .package(path: "../../Core/Architecture"),
    .package(path: "../../Core/DesignSystem"),
  ],
  targets: [
    .target(
      name: "Home",
      dependencies: [
        "Architecture",
        "DesignSystem",
      ]),
    .testTarget(
      name: "HomeTests",
      dependencies: ["Home"]),
  ])
