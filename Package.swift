// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnimationSwitchRootViewController",
    platforms: [.iOS(.v10)],
    products: [
        .library(
            name: "AnimationSwitchRootViewControllerObjC",
            targets: ["AnimationSwitchRootViewControllerObjC"]),
        .library(
            name: "AnimationSwitchRootViewController",
            targets: ["AnimationSwitchRootViewController"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AnimationSwitchRootViewControllerObjC",
            dependencies: [],
            path: "AnimationSwitchRootViewController",
            exclude: ["Info.plist", "Swift"],
            sources: ["ObjC"],
            cSettings: [.headerSearchPath("ObjC")]
        ),
        .target(
            name: "AnimationSwitchRootViewController",
            dependencies: [.byName(name: "AnimationSwitchRootViewControllerObjC")],
            path: "AnimationSwitchRootViewController",
            exclude: ["Info.plist", "ObjC"],
            sources: ["Swift"]
        )
    ]
)
