//
//  NSScreen+.swift
//  AppCoordinator
//
//  Created by 이전희 on 4/13/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import AppKit

public extension NSScreen {
    enum ScreenHorizontalPosition {
        case left
        case center
        case right
        case custom(x: CGFloat)
    }
    
    enum ScreenVerticalPosition {
        case top
        case center
        case bottom
        case custom(y: CGFloat)
    }
    
    enum ScreenPosition {
        case topLeft
        case topCenter
        case topRight
        case centerLeft
        case center
        case centerRight
        case bottomLeft
        case bottomCenter
        case bottomRight
        case custom(x: CGFloat, y: CGFloat)
        
        var vertical: ScreenVerticalPosition {
            return switch self {
            case .topLeft, .topCenter, .topRight: .top
            case .centerLeft, .center, .centerRight: .center
            case .bottomLeft, .bottomCenter, .bottomRight: .bottom
            case let .custom(_, y): .custom(y: y)
            }
        }
        
        var horizontal: ScreenHorizontalPosition {
            return switch self {
            case .topLeft, .centerLeft, .bottomLeft: .left
            case .topCenter, .center, .bottomCenter: .center
            case .topRight, .centerRight, .bottomRight: .right
            case let .custom(x, _): .custom(x: x)
            }
        }
    }
    
    func position(_ position: ScreenPosition,
                  windowSize: CGSize = CGSize(width: 0, height: 0)) -> CGPoint {
        let screenFrame = self.visibleFrame
        let x = switch position.horizontal {
        case .left: screenFrame.minX  - windowSize.width
        case .center: screenFrame.midX - (windowSize.width / 2)
        case .right: screenFrame.maxX
        case let .custom(x): x
        }
        let y = switch position.vertical {
        case .top: screenFrame.maxY - windowSize.height
        case .center: screenFrame.midY - (windowSize.height / 2)
        case .bottom: screenFrame.minY
        case let .custom(y): y
        }
        return CGPoint(x: x, y: y)
    }
}
