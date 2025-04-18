// swift-tools-version: 5.9
@preconcurrency import PackageDescription

#if TUIST
@preconcurrency import ProjectDescription

let packageSettings = PackageSettings(
    productTypes: ["Swinject": .framework]
)
#endif

let package = Package(
    name: "SyncNest",
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject", from: "2.9.1"),
    ]
)
