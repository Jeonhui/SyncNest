//
//  DSSplitViewControllerRepresentable.swift
//  CoreUI
//
//  Created by 이전희 on 4/16/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import AppKit
import SwiftUI
import Combine

// MARK: - DSSplitView Types
public enum DSSplitViewEdge {
    case vertical
    case horizontal
}

public struct DSSplitViewDividerStyle {
    public typealias DividerThickness = NSSplitView.DividerStyle
    
    let color: Color?
    let style: DividerThickness?
    
    public init(color: Color? = nil,
                style: DividerThickness? = nil) {
        self.color = color
        self.style = style
    }
    
    fileprivate func toDSNSSplitViewDividerStyle() -> DSNSSplitView.DSNSSplitViewDividerStyle {
        if let color = color {
            return DSNSSplitView.DSNSSplitViewDividerStyle(
                color: NSColor(color),
                style: style
            )
        }
        return DSNSSplitView.DSNSSplitViewDividerStyle(
            style: style
        )
    }
}

// MARK: - Related to NSSplitView
// DSNSSplitView, DSNSSplitViewController
fileprivate class DSNSSplitView: NSSplitView {
    private(set) var dividerRect: NSRect? = nil
    
    fileprivate struct DSNSSplitViewDividerStyle {
        let color: NSColor?
        let style: NSSplitView.DividerStyle?
        
        init(color: NSColor? = nil,
             style: NSSplitView.DividerStyle? = nil) {
            self.color = color
            self.style = style
        }
    }
    
    var dsnsSplitViewDividerStyle: DSNSSplitViewDividerStyle?
    
    override func draw(_ dirtyRect: NSRect) {
        if let style = dsnsSplitViewDividerStyle?.style {
            self.dividerStyle = style
        }
        super.draw(dirtyRect)
    }
    
    override func drawDivider(in rect: NSRect) {
        if let color = dsnsSplitViewDividerStyle?.color {
            self.setValue(color, forKey: "dividerColor")
        }
        dividerRect = rect
        super.drawDivider(in: rect)
    }
}

fileprivate class DSNSSplitViewController: NSSplitViewController {
    private var lastDividerPostion: CGPoint? = nil
    private var didAppear: Bool = false
    @Binding private var isCollapsed: Bool
    private var setIsCollapsedByInnerFunction: Bool = false
    
    init(isCollapsed: Binding<Bool>) {
        self._isCollapsed = isCollapsed
        super.init(nibName:nil, bundle:nil)
        self.splitView = DSNSSplitView()
        self.splitView.dividerStyle = .thin
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear() {
        didAppear = true
    }
    
    func setDirection(_ direction: DSSplitViewEdge) {
        self.splitView.isVertical = direction == .horizontal
    }
    
    func setDividerStyle(_ dividerStyle: DSNSSplitView.DSNSSplitViewDividerStyle) {
        (self.splitView as? DSNSSplitView)?.dsnsSplitViewDividerStyle = dividerStyle
        
    }
    
    override func splitViewDidResizeSubviews(_ notification: Notification) {
        saveDividerPosition()
        guard didAppear,
              let isSubContentViewCollapsed = splitViewItems.first?.isCollapsed,
              isCollapsed != isSubContentViewCollapsed else { return }
        DispatchQueue.main.async {
            self.isCollapsed = isSubContentViewCollapsed
        }
    }
    
    func setCollapsed(_ isCollapsed: Bool) {
        guard didAppear else { return }
        if (!isCollapsed) {
            setDividerPosition()
        }
        splitViewItems.first?.isCollapsed = isCollapsed
        splitView.setNeedsDisplay(splitView.bounds)
        splitView.window?.invalidateCursorRects(for: splitView)
    }
    
    func saveDividerPosition() {
        guard let dividerPosition = (self.splitView as? DSNSSplitView)?.dividerRect?.origin else { return }
        let positionValue = splitView.isVertical ? dividerPosition.x : dividerPosition.y
        if positionValue == 0 { return }
        lastDividerPostion = dividerPosition
    }
    
    func setDividerPosition() {
        guard let pos = lastDividerPostion else { return }
        let positionValue = splitView.isVertical ? pos.x : pos.y
        splitView.setPosition(positionValue, ofDividerAt: 0)
    }
}

// MARK: - DSSplitViewControllerRepresentable
private struct DSSplitViewControllerRepresntableDividerStyleKey: EnvironmentKey {
    static let defaultValue: DSSplitViewDividerStyle = .init()
}

private extension EnvironmentValues {
    var dsSplitViewDividerStyle: DSSplitViewDividerStyle {
        get { self[DSSplitViewControllerRepresntableDividerStyleKey.self] }
        set { self[DSSplitViewControllerRepresntableDividerStyleKey.self] = newValue }
    }
}

public struct DSSplitViewControllerRepresentable<Content, SubContent>:
    NSViewControllerRepresentable where Content: View, SubContent: View {
    @Environment(\.dsSplitViewDividerStyle) private var dividerStyle
    private let direction: DSSplitViewEdge
    private let canCollapse: Bool
    @Binding private var isCollapsed: Bool
    @ViewBuilder private let content: () -> Content
    @ViewBuilder private let subContent: () -> SubContent
    
    public init(_ direction: DSSplitViewEdge = .horizontal,
                isCollapsed: Binding<Bool>? = nil,
                @ViewBuilder subContent: @escaping () -> SubContent,
                @ViewBuilder content: @escaping () -> Content) {
        self.direction = direction
        if let isCollapsed = isCollapsed {
            canCollapse = true
            self._isCollapsed = isCollapsed
        } else {
            canCollapse = false
            self._isCollapsed = .constant(false)
        }
        self.content = content
        self.subContent = subContent
    }
    
    public func makeNSViewController(context: Context) -> NSViewController {
        let splitViewController = DSNSSplitViewController(isCollapsed: $isCollapsed)
        let contentViewController = NSHostingController(rootView: AnyView(content()))
        let subContentViewController = NSHostingController(rootView: AnyView(subContent()))
        let subContentViewItem = NSSplitViewItem(viewController: subContentViewController)
        let contentViewItem = NSSplitViewItem(viewController: contentViewController)
        
        subContentViewItem.canCollapse = canCollapse
        subContentViewItem.isCollapsed = isCollapsed
        
        splitViewController.addSplitViewItem(subContentViewItem)
        splitViewController.addSplitViewItem(contentViewItem)
        
        splitViewController.setDirection(direction)
        splitViewController.setDividerStyle(dividerStyle.toDSNSSplitViewDividerStyle())
        
        return splitViewController
    }
    
    public func updateNSViewController(_ controller: NSViewController,
                                       context: Context) {
        guard let controller = controller as? DSNSSplitViewController else { return }
        controller.setCollapsed(isCollapsed)
        controller.setDividerStyle(dividerStyle.toDSNSSplitViewDividerStyle())
        guard controller.splitViewItems.count >= 2 else { return }
        if let subContentHost = controller.splitViewItems[0]
            .viewController as? NSHostingController<AnyView> {
            subContentHost.rootView = AnyView(subContent())
        }
        if let contentHost = controller.splitViewItems[1]
            .viewController as? NSHostingController<AnyView> {
            contentHost.rootView = AnyView(content())
        }
    }
    
    public func setDividerStyle(_ dividerStyle: DSSplitViewDividerStyle) -> some View {
        environment(\.dsSplitViewDividerStyle, dividerStyle)
    }
}
