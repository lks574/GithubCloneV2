// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Home",
  products: [
    .library(
      name: "Home",
      targets: ["Home"]),
  ],
  targets: [
    .target(
      name: "Home"),
    .testTarget(
      name: "HomeTests",
      dependencies: ["Home"]),
  ])
