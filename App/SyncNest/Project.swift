//
//  Project.swift
//  Manifests
//
//  Created by 이전희 on 4/9/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

@preconcurrency import ProjectDescription
import ClarchPlugin
import SyncNestConfigurationPlugin

nonisolated(unsafe) let project: Project = .app(
    appName: SyncNestConfiguration.appName,
    organizationName: SyncNestConfiguration.organizationName,
    layerModuleDependencies: [
        // MARK: - App(DIContainer, CoordinatorInterface)
        .diContainer(),
        .coordinatorInterface(moduleName: "app"),
    ],
    targetOptions: [
        .default: .init(
            destinations: SyncNestConfiguration.destinations,
            deploymentTargets: SyncNestConfiguration.deploymentTargets,
            infoPlist: .file(path: .relativeToCurrentFile("./Resources/Info.plist"))
        )
    ]
)
