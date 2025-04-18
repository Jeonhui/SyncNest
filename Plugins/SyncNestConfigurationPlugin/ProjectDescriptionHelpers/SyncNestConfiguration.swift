//
//  SyncNestConfiguration.swift
//  Plugins
//
//  Created by Jeonhui on 3/20/25
//

@preconcurrency import ProjectDescription

public class SyncNestConfiguration {
    private init() {}
    public static let appName: String = "SyncNest"
    public static let organizationName: String = "com.jeongui"
    public static let destinations: Destinations = .macOS
    public static let deploymentTargets: DeploymentTargets = .macOS("15.0")
}
