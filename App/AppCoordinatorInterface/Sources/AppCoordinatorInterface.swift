//
//  AppCoordinatorInterface.swift
//  AppCoordinatorInterface
//
//  Created by 이전희 on 4/10/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI

public protocol AppCoordinatorInterface: AnyObject {
    // MARK: - For App
    var rootView: AnyView { get }
    func start(didLaunchByUser: Bool)
    
    // MARK: - For Feature
    func changeMode(_ mode: AppCoordinatorMode)
    func moveTo(_ destination: AppCoordinatorDestination)
}

public extension AppCoordinatorInterface {
    func start(didLaunchByUser: Bool = true) {
        self.start(didLaunchByUser: didLaunchByUser)
    }
}
