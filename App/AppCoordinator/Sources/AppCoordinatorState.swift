//
//  AppCoordinatorState.swift
//  AppCoordinator
//
//  Created by 이전희 on 4/12/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import AppCoordinatorInterface

final class AppCoordinatorState: ObservableObject {
    @Published var useWindow: Bool
    @Published var windowSize: CGSize
    @Published var navigationPath: NavigationPath
    @Published var destination: AppCoordinatorDestination
    @Published var mode: AppCoordinatorMode
    
    init(useWindow: Bool = false,
         windowSize: CGSize = CGSize(width: 800, height: 600),
         navigationPath: NavigationPath = .init(),
         destination: AppCoordinatorDestination = .main,
         mode: AppCoordinatorMode = .default) {
        self.useWindow = useWindow
        self.windowSize = windowSize
        self.navigationPath = navigationPath
        self.destination = destination
        self.mode = mode
    }
}
