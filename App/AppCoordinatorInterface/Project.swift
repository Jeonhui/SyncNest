//
//  Project.swift
//  Manifests
//
//  Created by 이전희 on 4/10/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

@preconcurrency import ProjectDescription
import ClarchPlugin
import SyncNestConfigurationPlugin

nonisolated(unsafe) let project: Project = .coordinatorInterface(
    appName: SyncNestConfiguration.appName,
    moduleName: "app",
    organizationName: SyncNestConfiguration.organizationName,
    targetOptions: [
        .default: .init(
            destinations: SyncNestConfiguration.destinations,
            deploymentTargets: SyncNestConfiguration.deploymentTargets
        )
    ]
)
