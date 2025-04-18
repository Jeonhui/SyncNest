//
//  StatusMenuView.swift
//  StatusMenuFeature
//
//  Created by 이전희 on 4/12/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI

public final class StatusMenuViewModel: ObservableObject {
    public init() { }
}

public struct StatusMenuView: View {
    @ObservedObject var viewModel: StatusMenuViewModel
    
    public init(viewModel: StatusMenuViewModel){
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Text("StatusMenuView")
    }
}
