//
//  AppWindow.swift
//  AppCoordinator
//
//  Created by 이전희 on 4/13/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import CoreUI

class AppWindow: NSWindow {
    var onDeinit: (() -> Void)?
    
    override init(contentRect: NSRect,
                  styleMask: StyleMask = [.titled,
                                          .closable,
                                          .resizable,
                                          .miniaturizable],
                  backing: BackingStoreType = .buffered,
                  defer flag: Bool = false) {
        super.init(contentRect: contentRect,
                   styleMask: styleMask,
                   backing: backing,
                   defer: flag)
        self.titlebarAppearsTransparent = true
        self.titleVisibility = .hidden
        self.backgroundColor = .assets.gray100
    }
    
    func setContentView(_ view: some View) {
        self.contentView = NSHostingView(rootView: view)
    }
    
    deinit {
        onDeinit?()
    }
    
    override func display() {
        self.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }
}

extension AppWindow: NSWindowDelegate {
    
}

