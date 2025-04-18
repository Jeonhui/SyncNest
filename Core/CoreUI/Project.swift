//
//  Project.swift
//  Manifests
//
//  Created by 이전희 on 4/11/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

@preconcurrency import ProjectDescription
import ClarchPlugin
import TRSEPlugin
import SyncNestConfigurationPlugin

nonisolated(unsafe) let project: Project = .core(
    appName: SyncNestConfiguration.appName,
    moduleName: "UI",
    organizationName: SyncNestConfiguration.organizationName,
    targetOptions: [
        .default: .init(
            destinations: SyncNestConfiguration.destinations,
            deploymentTargets: SyncNestConfiguration.deploymentTargets,
            additionalResources: [
                .glob(pattern: .relativeToCurrentFile("./Resources/**"))
            ]
        )
    ],
    resourceSynthesizers: [
        .assets(),
        .assetsExtension()
    ]
)
