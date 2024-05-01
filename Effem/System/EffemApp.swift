//
//  EffemApp.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

@main
@MainActor
struct EffemApp: App {
    @State private var state = AppState()
    @State private var mediaPlaybackManager = MediaPlaybackManager()
    
    var body: some Scene {
        WindowGroup {
            AppPresenter()
                .environment(state)
                .environment(mediaPlaybackManager)
                .setupModel()
                .setTheme()
        }
    }
}
