//
//  StatusMenuItemButtonImage+.swift
//  StatusMenuItemFeatureImplementation
//
//  Created by 이전희 on 4/11/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import AppKit
import CoreUI
import StatusMenuItemFeatureInterface

public extension StatusMenuItemButtonImage {
    static let defaultImage: StatusMenuItemButtonImage = StatusMenuItemButtonImage(
        images: [
            .assets.birdStatusMenuIcon1,
            .assets.birdStatusMenuIcon2,
            .assets.birdStatusMenuIcon3,
            .assets.birdStatusMenuIcon4,
            .assets.birdStatusMenuIcon5,
            .assets.birdStatusMenuIcon6,
            .assets.birdStatusMenuIcon7,
            .assets.birdStatusMenuIcon8,
            .assets.birdStatusMenuIcon9,
            .assets.birdStatusMenuIcon10,
            .assets.birdStatusMenuIcon11,
            .assets.birdStatusMenuIcon12,
            .assets.birdStatusMenuIcon13,
            .assets.birdStatusMenuIcon14,
            .assets.birdStatusMenuIcon15,
            .assets.birdStatusMenuIcon16,
        ]
    )
    
    static let activeImage: StatusMenuItemButtonImage = StatusMenuItemButtonImage(
        images: [
            .assets.activeStatusMenuIcon1,
            .assets.activeStatusMenuIcon2,
            .assets.activeStatusMenuIcon3,
            .assets.activeStatusMenuIcon4,
            .assets.activeStatusMenuIcon5,
            .assets.activeStatusMenuIcon6,
            .assets.activeStatusMenuIcon7,
            .assets.activeStatusMenuIcon8,
            .assets.activeStatusMenuIcon9,
            .assets.activeStatusMenuIcon10,
            .assets.activeStatusMenuIcon11,
            .assets.activeStatusMenuIcon12,
            .assets.activeStatusMenuIcon13,
            .assets.activeStatusMenuIcon14,
            .assets.activeStatusMenuIcon15
        ]
    )
    
    static let effectImage: StatusMenuItemButtonImage = StatusMenuItemButtonImage(
        images: [
            NSImage(systemSymbolName: "arrowshape.turn.up.forward",
                    accessibilityDescription: ""),
            NSImage(systemSymbolName: "arrowshape.turn.up.forward.fill",
                    accessibilityDescription: ""),
            NSImage(systemSymbolName: "arrowshape.turn.up.forward.circle",
                    accessibilityDescription: ""),
            NSImage(systemSymbolName: "arrowshape.turn.up.forward.circle.fill",
                    accessibilityDescription: ""),
            NSImage(systemSymbolName: "arrowshape.turn.up.left.2",
                    accessibilityDescription: ""),
            NSImage(systemSymbolName: "arrowshape.turn.up.left.2.fill",
                    accessibilityDescription: "")
        ].compactMap { $0 })
    
    static let quitImage: StatusMenuItemButtonImage = StatusMenuItemButtonImage(
        images: [
            NSImage(systemSymbolName: "command",
                    accessibilityDescription: ""),
            NSImage(systemSymbolName: "command.circle",
                    accessibilityDescription: ""),
            NSImage(systemSymbolName: "command.circle.fill",
                    accessibilityDescription: ""),
            NSImage(systemSymbolName: "command.square",
                    accessibilityDescription: ""),
            NSImage(systemSymbolName: "command.square.fill",
                    accessibilityDescription: ""),
            NSImage(systemSymbolName: "space",
                    accessibilityDescription: "")
        ].compactMap { $0 })
}
