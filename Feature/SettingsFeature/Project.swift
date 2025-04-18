//
//  Project.swift
//  Manifests
//
//  Created by 이전희 on 4/13/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

@preconcurrency import ProjectDescription
import ClarchPlugin
import SyncNestConfigurationPlugin

nonisolated(unsafe) let project: Project = .feature(
    appName: SyncNestConfiguration.appName,
    moduleName: "settings",
    organizationName: SyncNestConfiguration.organizationName,
    layerModuleDependencies: [
        .core(moduleName: "UI")
    ],
    targetOptions: [
        .default: .init(
            destinations: SyncNestConfiguration.destinations,
            deploymentTargets: SyncNestConfiguration.deploymentTargets
        )
    ]
)

