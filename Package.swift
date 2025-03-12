// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ascii",
  products: [
    .library(
      name: "ASCII",
      targets: ["ASCII"])
  ],
  targets: [
    .target(
      name: "ASCII"),
    .testTarget(
      name: "ASCIITests",
      dependencies: ["ASCII"]),
  ]
)
