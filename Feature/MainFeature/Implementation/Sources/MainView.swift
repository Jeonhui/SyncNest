//
//  MainView.swift
//  MainFeature
//
//  Created by 이전희 on 4/13/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import CoreUI
import SharedExtension

struct Ocean: Identifiable, Hashable, Equatable {
    let name: String
    let id = UUID()
    
}

public final class MainViewModel: ObservableObject {
    @UserDefaultWrapper(key: "\(MainViewModel.self)SidebarWidth",
                        defaultValue: 250)
    var sidebarWidth: CGFloat!
    var moveToSettings: (() -> Void)!
    @Published var navigationPath: NavigationPath = .init()
    
    public init() { }
    
    func navigateToDetail(for ocean: Ocean) {
//        navigationPath.append(ocean)
    }
}

public struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    @State var hideSidebar: Bool = false
    
    private var oceans = [
        Ocean(name: "Pacific"),
        .init(name: "Atlantic"),
        .init(name: "Indian"),
        .init(name: "Southern"),
        .init(name: "Arctic"),
    ]
    
    @State private var selectedItem: Ocean? = nil
    
    public init(viewModel: MainViewModel){
        self.viewModel = viewModel
    }
    
    public var body: some View {
        DSHSplitView(hideSidebar: $hideSidebar) {
            DSSelectionList(oceans,
                            selection: $selectedItem) { sync in
                SidebarListItemView(name: sync.name,
                                    isSelected: sync == selectedItem)
            }
        } content: {
            content
        }
        .dsHSplitViewStyle(
            DSHSplitViewStyle(
                sidebarInitWidth: viewModel.sidebarWidth,
                sidebarMinWidth: 200,
                sidebarMaxWidth: 400,
                dividerColor: .white,
                sidebarBackgroundColor: .assets.gray200
            )
        )
        .onDSHSplitViewSidebarWidthChange { width in
            guard self.viewModel.sidebarWidth != width else { return }
            self.viewModel.sidebarWidth = width
        }
        .onChange(of: selectedItem) { _, newValue in
            if let item = newValue {
                self.viewModel.navigateToDetail(for: item)
            }
        }
    }

    private var content: some View {
        VStack {
            Spacer()
            Button {
                hideSidebar.toggle()
            } label: {
                Text("toggle button \(hideSidebar)")
            }
            Spacer()
        }
    }
}

struct NavigationContentView: View {
    var body: some View {
        EmptyView()
    }
}
