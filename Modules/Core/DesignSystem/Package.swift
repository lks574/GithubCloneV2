// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "DesignSystem",
  products: [
    .library(
      name: "DesignSystem",
      targets: ["DesignSystem"]),
  ],
  targets: [
    .target(
      name: "DesignSystem"),
    .testTarget(
      name: "DesignSystemTests",
      dependencies: ["DesignSystem"]),
  ])
