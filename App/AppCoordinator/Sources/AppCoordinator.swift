//
//  AppCoordinator.swift
//  AppCoordinator
//
//  Created by 이전희 on 4/10/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import Combine
import SharedExtension

import AppCoordinatorInterface
import MainFeatureInterface
import SettingsFeatureInterface
import StatusMenuFeatureInterface

public class AppCoordinator: NSObject, AppCoordinatorInterface {
    @UserDefaultWrapper(key: "\(AppCoordinator.self)WindowSize",
                        defaultValue: CGSize(width: 800, height: 600))
    private var windowSize: CGSize!
    
    private lazy var state: AppCoordinatorState = AppCoordinatorState(
        windowSize: windowSize
    )
    private var cancellable = Set<AnyCancellable>()
    
    private var statusMenuItem: NSStatusItem!
    private var window: AppWindow? = nil
    private let screen = NSScreen.main!
    private lazy var screenFrame = screen.visibleFrame
    private lazy var windowPosition = screen.position(.topCenter,
                                                      windowSize: windowSize)
    
    public lazy var rootView: AnyView = {
        AnyView(AppRootView(state: state,
                            minSize: CGSize(width: 800, height: 450),
                            destinations: [
                                AppTabDestination(destination: .main, view: mainCoordinator.startView),
                                AppTabDestination(destination: .settings, view: settingsCoordinator.startView)
                            ]))
    }()
    
    // MARK: - Coordinators
    private let mainCoordinator: MainCoordinatorInterface
    private let settingsCoordinator: SettingsCoordinatorInterface
    private let statusMenuCoordinator: StatusMenuCoordinatorInterface
    
    // MARK: - Initialize
    public init(
        mainCoordinator: MainCoordinatorInterface,
        settingsCoordinator: SettingsCoordinatorInterface,
        statusMenuCoordinator: StatusMenuCoordinatorInterface
    ) {
        self.mainCoordinator = mainCoordinator
        self.settingsCoordinator = settingsCoordinator
        self.statusMenuCoordinator = statusMenuCoordinator
    }
    
    private func bind() {
        self.state.$useWindow.sink { useWindow in
            if useWindow {
                self.displayWindow()
            } else {
                self.removeWindow()
            }
        }
        .store(in: &cancellable)
        
        self.state.$windowSize.sink { size in
            self.windowSize = size
        }
        .store(in: &cancellable)
    }
    
    // MARK: App Coordinator Interface Implementation
    public func start(didLaunchByUser: Bool) {
        self.bind()
        self.displayStatusMenu()
        self.state.useWindow = didLaunchByUser
    }
    
    public func changeMode(_ mode: AppCoordinatorMode) {
        self.state.mode = mode
    }
    
    public func moveTo(_ destination: AppCoordinatorDestination) {
        self.state.destination = destination
    }
    
    // MARK: - statusMenu & window
    private func displayStatusMenu() {
        if statusMenuItem == nil {
            self.statusMenuItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        }
        self.statusMenuItem.button?.title = "S"
    }
    
    private func displayWindow() {
        NSApp.setActivationPolicy(.regular)
        if let window = window {
            window.display()
            return
        }
        let window = AppWindow(contentRect: NSRect(origin: windowPosition,
                                                   size: windowSize))
        window.onDeinit = {
            guard self.state.useWindow else { return }
            self.state.useWindow = false
        }
        window.setContentView(rootView)
        self.window = window
        window.display()
    }
    
    private func removeWindow() {
        NSApp.setActivationPolicy(.accessory)
        self.window = nil
    }
}
