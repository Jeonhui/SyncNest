//
//  ExampleSettingsView.swift
//  SettingsFeature
//
//  Created by 이전희 on 4/13/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import UIKit
import SettingsFeatureImplementation

@main
struct ExampleSettingsView: App {
    var body: some Scene {
        WindowGroup {
            SettingsView(viewModel: SettingsViewModel())
        }
    }
}
