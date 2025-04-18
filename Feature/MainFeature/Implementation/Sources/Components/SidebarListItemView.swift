//
//  SidebarListItemView.swift
//  MainFeatureImplementation
//
//  Created by 이전희 on 4/15/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import CoreUI

struct SidebarListItemView: View {
    private let name: String
    @State private var isHover: Bool = false
    private let isSelected: Bool
    
    init(name: String,
         isSelected: Bool) {
        self.name = name
        self.isSelected = isSelected
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(name)")
            HStack { Spacer() }
                .frame(height: 0)
        }
        .background(
            isSelected ? .blue : isHover ? .yellow : .clear
        )
        .onHover { isHover in
            self.isHover = isHover
        }
    }
}
