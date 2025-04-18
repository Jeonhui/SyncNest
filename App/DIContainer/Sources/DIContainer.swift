//
//  DIContainer.swift
//  DIContainer
//
//  Created by 이전희 on 4/10/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import Swinject

public class DIContainer {
    public static let shared = DIContainer()
    private init() { }
    
    public lazy var container = {
        let container = Container()
        registerCoordinators(container: container)
        return container
    }()
}
