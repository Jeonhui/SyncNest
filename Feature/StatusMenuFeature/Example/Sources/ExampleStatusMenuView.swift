//
//  ExampleStatusMenuView.swift
//  StatusMenuFeature
//
//  Created by 이전희 on 4/12/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import UIKit
import StatusMenuFeatureImplementation

@main
struct ExampleStatusMenuView: App {
    var body: some Scene {
        WindowGroup {
            StatusMenuView(viewModel: StatusMenuViewModel())
        }
    }
}
