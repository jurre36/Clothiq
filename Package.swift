// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "ClothiqApp",
    platforms: [
        .iOS(.v16)  // Specify the minimum iOS version, adjust as necessary
    ],
    products: [
        .library(
            name: "ClothiqApp",
            targets: ["ClothiqApp"]
        ),
    ],
    dependencies: [
        // Add any external packages you need here
        // Example of Alamofire for networking
        // .package(url: "https://github.com/Alamofire/Alamofire.git", from: "5.4.0"),
    ],
    targets: [
        .target(
            name: "ClothiqApp",
            dependencies: []  // Dependencies can be added here if needed
        ),
        .testTarget(
            name: "ClothiqAppTests",
            dependencies: ["ClothiqApp"]
        ),
    ]
)
