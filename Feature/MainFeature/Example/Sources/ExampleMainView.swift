//
//  ExampleMainView.swift
//  MainFeature
//
//  Created by 이전희 on 4/13/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import UIKit
import MainFeatureImplementation

@main
struct ExampleMainView: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: MainViewModel())
        }
    }
}
