//
//  SettingsView.swift
//  SettingsFeature
//
//  Created by 이전희 on 4/13/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI

public final class SettingsViewModel: ObservableObject {
    var moveToMain: (() -> Void)!
    public init() { }
}

public struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    
    public init(viewModel: SettingsViewModel){
        self.viewModel = viewModel
    }
    
    public var body: some View {
        VStack {
            Text("SettingsView")
            Button {
                viewModel.moveToMain()
            } label: {
                Text("move to main")
            }
        }
    }
}
