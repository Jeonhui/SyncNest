//
//  AppRootView.swift
//  AppCoordinator
//
//  Created by 이전희 on 4/14/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import AppCoordinatorInterface
import CoreUI

struct AppTabDestination: Identifiable {
    let destination: AppCoordinatorDestination
    let view: AnyView
    
    var id: AppCoordinatorDestination {
        return destination
    }
}

struct AppRootView: View {
    @ObservedObject var state: AppCoordinatorState
    let minSize: CGSize
    let destinations: [AppTabDestination]
    
    init(state: AppCoordinatorState,
         minSize: CGSize,
         destinations: [AppTabDestination]) {
        self.state = state
        self.minSize = minSize
        self.destinations = destinations
    }
    
    var body: some View {
        TabView(selection: $state.destination) {
            Group {
                ForEach(destinations) { destination in
                    destination.view
                        .id(destination.destination)
                        .toolbarItemHidden(true)
                }
            }
        }
    }
}
