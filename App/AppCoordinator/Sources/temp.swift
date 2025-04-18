//
//  AppCoordintaor+StatusMenu.swift
//  AppCoordinator
//
//  Created by 이전희 on 4/12/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI
import AppCoordinatorInterface


/*
extension AppCoordinator {
    private var statusMenuItem: NSStatusItem?
    private let statusMenuItemCoordinator: StatusMenuItemCoordinatorInterface
    
    
    private var statusMenuItemButtonImage: StatusMenuItemButtonImage? = nil
    private var animationTimer: Timer? = nil
    private var currentFrame: Int = 0
    
    public init(statusMenuItemCoordinator: StatusMenuItemCoordinatorInterface) {
        self.statusMenuItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        self.statusMenuItemCoordinator = statusMenuItemCoordinator
    }
    
    public func start() {
        changeTo(.default)
    }
    
    public func changeTo(_ destination: StatusMenuDestination) {
        let image = statusMenuItemCoordinator.statusMenuButtonImage(destination)
        initStatusMenuItemButtonImage(image)
        setStatusMenuItems()
    }
    
    // MARK: - StatusMenuItemButtonImage
    private func initStatusMenuItemButtonImage(_ statusMenuItemButtonImage: StatusMenuItemButtonImage) {
        guard let button = statusMenuItem?.button else { return }
        self.statusMenuItemButtonImage = statusMenuItemButtonImage
        self.animationTimer?.invalidate()
        self.animationTimer = nil
        self.currentFrame = 0
        
        if let image = statusMenuItemButtonImage.images.first {
            button.image = image
        }
        if (statusMenuItemButtonImage.isAnimation) {
            startStatusMenuButtonImageAnimation()
        }
    }
    
    private func startStatusMenuButtonImageAnimation() {
        guard let buttonImage = self.statusMenuItemButtonImage,
              buttonImage.isAnimation else { return }
        self.animationTimer = Timer.scheduledTimer(withTimeInterval: buttonImage.frameDuration,
                                                   repeats: true) { [weak self] _ in
            guard let self = self else { return }
            guard let button = self.statusMenuItem?.button,
                  let buttonImage = self.statusMenuItemButtonImage,
                  buttonImage.isAnimation,
                  buttonImage.images.count > 1 else {
                self.stopStatusMenuButtonImageAnimation()
                return
            }
            button.image = buttonImage.images[self.currentFrame]
            self.currentFrame = (self.currentFrame + 1) % buttonImage.images.count
        }
        RunLoop.main.add(animationTimer!, forMode: .common)
    }
    
    private func stopStatusMenuButtonImageAnimation() {
        animationTimer?.invalidate()
        animationTimer = nil
    }
    
    // MARK: - Status Menu Items
    func setStatusMenuItems() {
        let menu = NSMenu()
        
        let menuItems = [
            NSMenuItem.separator(),
            NSMenuItem(title: "quit",
                       action: #selector(quit),
                       keyEquivalent: "q")
        ]
        menuItems.forEach { menuItem in
            menuItem.target = self
            menu.addItem(menuItem)
        }
        self.statusMenuItem?.button?.target = self
        self.statusMenuItem?.menu = menu
    }
    
    @objc func changeToDefault() {
        changeTo(.default)
    }
    
    @objc func changeToActive() {
        changeTo(.active)
    }
    
    @objc func changeToEffect() {
        changeTo(.effect)
    }
    
    @objc func quit() {
        NSApp.terminate(nil)
    }
}

*/
