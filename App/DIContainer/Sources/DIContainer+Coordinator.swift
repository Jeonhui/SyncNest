//
//  DIContainer+Coordinator.swift
//  DIContainer
//
//  Created by 이전희 on 4/10/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import Swinject
import AppCoordinatorInterface
import AppCoordinator
import MainFeatureInterface
import MainFeatureImplementation
import SettingsFeatureInterface
import SettingsFeatureImplementation
import StatusMenuFeatureInterface
import StatusMenuFeatureImplementation


public extension DIContainer {
    func registerCoordinators(container: Container) {
        container.registerInObjectScopeContainer(MainCoordinatorInterface.self) { r in
            MainCoordinator()
        }
        
        container.registerInObjectScopeContainer(SettingsCoordinatorInterface.self) { r in
            SettingsCoordinator()
        }
        
        container.registerInObjectScopeContainer(StatusMenuCoordinatorInterface.self) { r in
            StatusMenuCoordinator()
        }
        
        container.registerInObjectScopeContainer(AppCoordinatorInterface.self) { r in
            let mainCoordinator = r.resolve(MainCoordinatorInterface.self)!
            let settingsCoordinator = r.resolve(SettingsCoordinatorInterface.self)!
            let statusMenuCoordinator = r.resolve(StatusMenuCoordinatorInterface.self)!
            
            let appCoordinator = AppCoordinator(
                mainCoordinator: mainCoordinator,
                settingsCoordinator: settingsCoordinator,
                statusMenuCoordinator: statusMenuCoordinator
            )
            
            [
                mainCoordinator,
                settingsCoordinator
            ].forEach { featureCoordinator in
                featureCoordinator.setAppCoordinator(appCoordinator)
            }
            
            return appCoordinator
        }
    }
}
