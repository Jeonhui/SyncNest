//
//  Container+.swift
//  DIContainer
//
//  Created by 이전희 on 4/9/25.
//  Copyright © 2025 com.thymedesk. All rights reserved.
//

import Swinject

extension Container {
    @discardableResult
    func registerInObjectScopeContainer<Service>(_ serviceType: Service.Type,
                                                 name: String? = nil,
                                                 factory: @escaping (Resolver) -> Service) -> ServiceEntry<Service>
    {
        self.register(serviceType, name: name, factory: factory)
            .inObjectScope(.container)
    }
}
