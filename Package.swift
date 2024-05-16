// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "GithubCloneV2",
  products: [
    .library(
      name: "GithubCloneV2",
      targets: ["GithubCloneV2"]),
  ],
  dependencies: [
    .package(url: "https://github.com/airbnb/swift", from: "1.0.7"),
  ],
  targets: [
    .target(
      name: "GithubCloneV2"),
    .testTarget(
      name: "GithubCloneV2Tests",
      dependencies: ["GithubCloneV2"]),
  ])
