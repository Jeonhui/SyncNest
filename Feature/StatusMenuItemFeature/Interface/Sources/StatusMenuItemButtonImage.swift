//
//  StatusMenuButtonImage.swift
//  StatusMenuItemFeatureInterface
//
//  Created by 이전희 on 4/11/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import AppKit

public struct StatusMenuItemButtonImage {
    private let _images: [NSImage]
    public let isAnimation: Bool
    public let frameDuration: TimeInterval
    public var images: [NSImage] {
        get {
            _images.map { image in
                let copiedImage = image.copy() as! NSImage
                copiedImage.size = NSSize(width: 18, height: 18)
                return copiedImage
            }
        }
    }
    
    public init(image: NSImage) {
        self._images = [image]
        self.isAnimation = false
        self.frameDuration = .nan
    }
    
    public init(images: [NSImage],
                frameDuration: TimeInterval = TimeInterval(0.1)) {
        self._images = images
        self.isAnimation = images.count > 1 ? true : false
        self.frameDuration = frameDuration
    }
}
