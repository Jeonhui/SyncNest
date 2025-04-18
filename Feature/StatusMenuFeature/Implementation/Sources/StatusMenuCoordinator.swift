//
//  StatusMenuCoordinator.swift
//  StatusMenuFeature
//
//  Created by 이전희 on 4/12/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import AppCoordinatorInterface
import StatusMenuFeatureInterface

public class StatusMenuCoordinator: StatusMenuCoordinatorInterface {
    weak private var appCoordinator: AppCoordinatorInterface?
    
    public init() {}
    
    public func setAppCoordinator(_ appCoordinator: AppCoordinatorInterface) {
        self.appCoordinator = appCoordinator
    }
}
