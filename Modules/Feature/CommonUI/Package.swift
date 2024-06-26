// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "CommonUI",
  platforms: [
    .iOS(.v17),
  ],
  products: [
    .library(
      name: "CommonUI",
      targets: ["CommonUI"]),
  ],
  targets: [
    .target(
      name: "CommonUI"),
    .testTarget(
      name: "CommonUITests",
      dependencies: ["CommonUI"]),
  ])
