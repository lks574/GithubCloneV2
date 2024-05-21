// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Platform",
  platforms: [
    .iOS(.v17),
  ],
  products: [
    .library(
      name: "Platform",
      targets: ["Platform"]),
  ],
  dependencies: [
    .package(path: "../../Core/Domain"),
    .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.9.1")),
    .package(
      url: "https://github.com/kean/Pulse",
      .upToNextMajor(from: "4.1.1")),
  ],
  targets: [
    .target(
      name: "Platform",
      dependencies: [
        "Domain",
        .product(name: "AlamofireDynamic", package: "Alamofire"),
        .product(name: "Pulse", package: "Pulse"),
      ],
      resources: [
        .copy("Resources/Mock/search_user.json"),
      ]),
    .testTarget(
      name: "PlatformTests",
      dependencies: ["Platform"]),
  ])
