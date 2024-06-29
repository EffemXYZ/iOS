//
//  MainTabBar.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

struct MainTabBar: View {
    @Environment(AppState.self) private var state
    @Environment(MediaPlaybackManager.self) private var mediaPlaybackManager
    @State private var triggerSensoryFeedback = false
    
    var body: some View {
        @Bindable var state = state
        
        /*
        TabView(selection: $state.tab) {
            Tab(value: .home, content: {
                HomePresenter()
                    .environment(state.homeState)
            }, label: {
                Label("home", systemImage: "music.note.house")
            })
            
            Tab(value: .live, content: {
                LivePresenter()
                    .environment(state.liveState)
            }, label: {
                Label("live", systemImage: "antenna.radiowaves.left.and.right")
            })
            
            Tab(value: .library, content: {
                LibraryPresenter()
                    .environment(state.libraryState)
            }, label: {
                Label("library", systemImage: "music.quarternote.3")
            })
            
            Tab(value: .search, content: {
                SearchPresenter()
                    .environment(state.searchState)
            }, label: {
                Label("search", systemImage: "magnifyingglass")
            })
        }
        .onChange(of: state.tab) { triggerSensoryFeedback.toggle() }
        .sensoryFeedback(.selection, trigger: triggerSensoryFeedback)
         */
        
        ZStack {
            LibraryPresenter()
                .environment(state.libraryState)
            
            // TODO: throw the music bar here
        }
        .sheet(item: $state.sheet) {
            switch $0 {
            case .nowPlaying:
                NowPlayingView()
            case .settings:
                SettingsPresenter()
                    .environment(state.settingsState)
                //                    .presentationDragIndicator(.visible)
            }
        }
        
    }
}

#Preview {
    MainTabBar()
        .environment(AppState())
        .environment(MediaPlaybackManager())
        .modelContainer(previewContainer)
}
