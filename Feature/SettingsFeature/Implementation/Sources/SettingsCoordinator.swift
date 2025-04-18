//
//  SettingsCoordinator.swift
//  SettingsFeature
//
//  Created by 이전희 on 4/13/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import AppCoordinatorInterface
import SettingsFeatureInterface

public class SettingsCoordinator: SettingsCoordinatorInterface {
    weak private var appCoordinator: AppCoordinatorInterface?
    
    public init() {}
    
    public var startView: AnyView {
        settingsView()
    }
    
    public func navigateTo(_ destination: SettingsCoordinatorDestination) -> AnyView {
        return switch destination {
            case .settings: settingsView()
        }
    }
    
    func settingsView() -> AnyView {
        let settingsViewModel = SettingsViewModel()
        settingsViewModel.moveToMain = { [weak self] in
            self?.appCoordinator?.moveTo(.main)
        }
        return AnyView(SettingsView(viewModel: settingsViewModel))
    }
    
    public func setAppCoordinator(_ appCoordinator: AppCoordinatorInterface) {
        self.appCoordinator = appCoordinator
    }
}
