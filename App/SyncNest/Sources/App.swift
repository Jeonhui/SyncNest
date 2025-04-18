//
//  App.swift 
//  SyncNest
//
//  Created by 이전희 on 4/9/25.
//  Copyright © 2025 com.jeonhui. All rights reserved.
//

import SwiftUI

@main
struct SyncNest: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings { EmptyView() }
    }
}
