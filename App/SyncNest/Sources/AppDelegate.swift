//
//  AppDelegate.swift
//  SyncNest
//
//  Created by 이전희 on 4/10/25.
//

import Cocoa
import SwiftUI
import Swinject
import DIContainer
import AppCoordinatorInterface

class AppDelegate: NSObject, NSApplicationDelegate {
    private let appCoordinator = DIContainer.shared.container.resolve(AppCoordinatorInterface.self)!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
#if DEBUG
        let didLaunchByUser = true
#else
        let didLaunchByUser = NSWorkspace.shared.frontmostApplication == NSRunningApplication.current
#endif
        appCoordinator.start(didLaunchByUser: didLaunchByUser)
    }
    
    func applicationShouldHandleReopen(_ sender: NSApplication,
                                       hasVisibleWindows flag: Bool) -> Bool {
        if !flag {
            appCoordinator.start()
        }
        return true
    }
}
