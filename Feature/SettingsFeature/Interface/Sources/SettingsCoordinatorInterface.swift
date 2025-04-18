//
//  SettingsCoordinatorInterface.swift
//  SettingsFeature
//
//  Created by 이전희 on 4/13/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import AppCoordinatorInterface

public protocol SettingsCoordinatorInterface: FeatureCoordinatorInterface {
    var startView: AnyView { get }
    func navigateTo(_ destination: SettingsCoordinatorDestination) -> AnyView
}
