// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Functor",
  products: [
    .library(
      name: "Functor",
      targets: ["Functor"]),
  ],
  targets: [
    .target(
      name: "Functor"),
    .testTarget(
      name: "FunctorTests",
      dependencies: ["Functor"]),
  ])
