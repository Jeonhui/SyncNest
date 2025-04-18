//
//  DSHSplitView.swift
//  CoreUI
//
//  Created by 이전희 on 4/14/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI

// MARK: - DSHSplitView Style
// DSHSplitView Style
public struct DSHSplitViewStyle {
    let isFixedWidth: Bool
    let sidebarInitWidth: CGFloat?
    let sidebarMinWidth: CGFloat
    let sidebarMaxWidth: CGFloat
    let dividerColor: Color?
    let dividerThickness: DSSplitViewDividerStyle.DividerThickness?
    let sidebarBackgroundColor: Color?
    let contentBackgroundColor: Color?
    
    public init(
        sidebarInitWidth: CGFloat? = nil,
        sidebarMinWidth: CGFloat = 100,
        sidebarMaxWidth: CGFloat = 400,
        dividerColor: Color? = nil,
        dividerThickness: DSSplitViewDividerStyle.DividerThickness? = .thin,
        sidebarBackgroundColor: Color? = nil,
        contentBackgroundColor: Color? = nil
    ) {
        self.sidebarMinWidth = sidebarMinWidth
        var sidebarInitWidth = sidebarInitWidth ?? sidebarMinWidth
        if sidebarInitWidth < sidebarMinWidth {
            sidebarInitWidth = sidebarMinWidth
        } else if sidebarMaxWidth < sidebarInitWidth {
            sidebarInitWidth = sidebarMaxWidth
        }
        self.isFixedWidth = false
        self.sidebarInitWidth = sidebarInitWidth
        self.sidebarMaxWidth = sidebarMaxWidth
        self.dividerColor = dividerColor
        self.dividerThickness = dividerThickness
        self.sidebarBackgroundColor = sidebarBackgroundColor
        self.contentBackgroundColor = contentBackgroundColor
    }
    
    public init(
        sidebarWidth: CGFloat = 200,
        dividerColor: Color? = nil,
        dividerThickness: DSSplitViewDividerStyle.DividerThickness? = .thin,
        sidebarBackgroundColor: Color? = nil,
        contentBackgroundColor: Color? = nil
    ) {
        self.isFixedWidth = true
        self.sidebarMinWidth = sidebarWidth
        self.sidebarInitWidth = sidebarWidth
        self.sidebarMaxWidth = sidebarWidth
        self.dividerColor = dividerColor
        self.dividerThickness = dividerThickness
        self.sidebarBackgroundColor = sidebarBackgroundColor
        self.contentBackgroundColor = contentBackgroundColor
    }
}

// Environment Key
private struct DSHSplitViewStyleKey: EnvironmentKey {
    static let defaultValue = DSHSplitViewStyle()
}

// Register Environment Key
fileprivate extension EnvironmentValues {
    var dsHSplitViewStyle: DSHSplitViewStyle {
        get { self[DSHSplitViewStyleKey.self] }
        set { self[DSHSplitViewStyleKey.self] = newValue }
    }
}

// View Extension
public extension View {
    func dsHSplitViewStyle(_ style: DSHSplitViewStyle) -> some View {
        environment(\.dsHSplitViewStyle, style)
    }
}

// MARK: - On DSHSplitView Sidebar Width Change
private struct OnDSHSplitViewSidebarWidthChangeKey: EnvironmentKey {
    static let defaultValue: (_ width: CGFloat) -> Void = { _ in }
}

extension EnvironmentValues {
    var onDSHSplitViewSidebarWidthChange: (_ width: CGFloat) -> Void {
        get { self[OnDSHSplitViewSidebarWidthChangeKey.self] }
        set { self[OnDSHSplitViewSidebarWidthChangeKey.self] = newValue }
    }
}

public extension View {
    func onDSHSplitViewSidebarWidthChange(completion: @escaping (_ width: CGFloat) -> Void) -> some View {
        environment(\.onDSHSplitViewSidebarWidthChange, completion)
    }
}

public struct DSHSplitView<Sidebar, Content>: View
where Sidebar: View, Content: View {
    @State private var color: Color = .red
    @State private var isInitialized: Bool = false
    @Binding private var hideSidebar: Bool
    
    @ViewBuilder var sidebar: () -> Sidebar
    @ViewBuilder var content: () -> Content
    @Environment(\.dsHSplitViewStyle) private var style
    @Environment(\.onDSHSplitViewSidebarWidthChange) private var onSidebarWidthChange
    
    public init(hideSidebar: Binding<Bool> = .constant(false),
                @ViewBuilder sidebar: @escaping () -> Sidebar,
                @ViewBuilder content: @escaping () -> Content) {
        self._hideSidebar = hideSidebar
        self.sidebar = sidebar
        self.content = content
    }
    
    public var body: some View {
        DSSplitViewControllerRepresentable(.horizontal,
                                           isCollapsed: $hideSidebar) {
            VStack {
                sidebar()
            }
            .frame(minWidth: style.sidebarMinWidth,
                   maxWidth: style.sidebarMaxWidth,
                   maxHeight: .infinity)
            .background(style.sidebarBackgroundColor)
            .onAppear {
                isInitialized = true
            }
        } content: {
            VStack {
                content()
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
            .layoutPriority(1)
            .background(style.contentBackgroundColor)
        }
        .setDividerStyle(.init(color: style.dividerColor,
                               style: style.dividerThickness))
        .frame(maxWidth: .infinity, maxHeight:.infinity)
    }
}
