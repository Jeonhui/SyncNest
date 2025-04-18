//
//  Project.swift
//  Manifests
//
//  Created by 이전희 on 4/14/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

@preconcurrency import ProjectDescription
import ClarchPlugin
import TRSEPlugin
import SyncNestConfigurationPlugin

nonisolated(unsafe) let project: Project = .shared(
    appName: SyncNestConfiguration.appName,
    moduleName: "extension",
    organizationName: SyncNestConfiguration.organizationName,
    targetOptions: [
        .default: .init(
            destinations: SyncNestConfiguration.destinations,
            deploymentTargets: SyncNestConfiguration.deploymentTargets
        )
    ],
    resourceSynthesizers: [
        .assets(),
        .assetsExtension()
    ]
)
