//
//  FeatureCoordinatorInterface.swift
//  AppCoordinatorInterface
//
//  Created by 이전희 on 4/10/25.
//

import SwiftUI

public protocol FeatureCoordinatorInterface: AnyObject {
    func setAppCoordinator(_ appCoordinator: AppCoordinatorInterface)
    
    var startView: AnyView { get }
}
