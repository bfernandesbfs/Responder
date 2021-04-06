// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Responder",
    products: [
        .library(
            name: "Responder",
            targets: ["Responder"]),
    ],
    targets: [
       .target(
            name: "Responder",
            dependencies: []),
        .testTarget(
            name: "ResponderTests",
            dependencies: ["Responder"]),
    ]
)
