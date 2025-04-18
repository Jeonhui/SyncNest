//
//  AppCoordinatorMode.swift
//  AppCoordinatorInterface
//
//  Created by 이전희 on 4/12/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import Foundation

public enum AppCoordinatorMode {
    case `default`
    case sync
    case conflict(reason: String)
    case warning(reason: String)
    case quit
}
