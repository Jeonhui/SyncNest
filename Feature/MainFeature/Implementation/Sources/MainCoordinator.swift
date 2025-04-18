//
//  MainCoordinator.swift
//  MainFeature
//
//  Created by 이전희 on 4/13/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import AppCoordinatorInterface
import MainFeatureInterface

public class MainCoordinator: MainCoordinatorInterface {
    weak private var appCoordinator: AppCoordinatorInterface?
    
    public init() { }
    
    public var startView: AnyView {
        return mainView()
    }
    
    public func navigateTo(_ destination: MainCoordinatorDestination) -> AnyView {
        return switch destination {
        case .main: mainView()
        }
    }
    
    private func mainView() -> AnyView {
        let mainViewModel = MainViewModel()
        mainViewModel.moveToSettings = { [weak self] in
            self?.appCoordinator?.moveTo(.settings)
        }
        return AnyView(MainView(viewModel: mainViewModel))
    }
    
    public func setAppCoordinator(_ appCoordinator: AppCoordinatorInterface) {
        self.appCoordinator = appCoordinator
    }
}
