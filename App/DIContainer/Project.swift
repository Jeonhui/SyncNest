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

nonisolated(unsafe) let project: Project = .diContainer(
    appName: SyncNestConfiguration.appName,
    organizationName: SyncNestConfiguration.organizationName,
    layerModuleDependencies: [
        // MARK: - App(Coordinator, CoordinatorInterface)
        .coordinator(moduleName: "app"),
        .coordinatorInterface(moduleName: "app"),
        
        // MARK: - Features
        .feature(moduleName: "main"),
        .feature(moduleName: "settings"),
        .feature(moduleName: "statusMenu")
    ],
    targetDependencies: [
        .external(name: "Swinject")
    ],
    targetOptions: [
        .default: .init(
            destinations: SyncNestConfiguration.destinations,
            deploymentTargets: SyncNestConfiguration.deploymentTargets
        )
    ]
)
