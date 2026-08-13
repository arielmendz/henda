// swift-tools-version: 5.10
// SPDX-FileCopyrightText: 2026 Ariel Mendez
// SPDX-License-Identifier: GPL-3.0-only

import PackageDescription

let package = Package(
    name: "Henda",
    platforms: [.macOS(.v13)],
    products: [
        .executable(name: "Henda", targets: ["Henda"]),
        .executable(name: "HendaLayoutTests", targets: ["HendaLayoutTests"])
    ],
    targets: [
        .target(name: "HendaCore"),
        .executableTarget(name: "Henda", dependencies: ["HendaCore"]),
        .executableTarget(
            name: "HendaLayoutTests",
            dependencies: ["HendaCore"],
            path: "Tests/HendaLayoutTests"
        )
    ]
)
