//
//  MainPresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

struct MainPresenter: View {
    @Environment(AppState.self) private var state
    
    var body: some View {
        @Bindable var state = state
        
        NavigationStack(path: $state.path) {
            ZStack {
                MainView()
                    .navigationDestination(for: LibraryCategory.self) {
                        LibraryCategoryView(type: $0)
                    }
                
                // TODO: throw the music bar here
            }
            .sheet(item: $state.sheet) {
                switch $0 {
                case .nowPlaying:
                    NowPlayingView()
                case .search:
                    SearchPresenter()
                        .environment(state.searchState)
                case .settings:
                    SettingsPresenter()
                        .environment(state.settingsState)
                    //                    .presentationDragIndicator(.visible)
                }
            }
            .fullScreenCover(item: $state.fullScreenCover) {
                switch $0 {
                case .live:
                    LivePresenter()
                        .environment(state.liveState)
                }
            }
        }
    }
}

fileprivate struct MainView: View {
    @Environment(AppState.self) private var state
    @Namespace private var topID
    
    var body: some View {
        @Bindable var state = state
        
        List {
            Section("library") {
                LibraryPathCell(path: .songs)
                    .listRowSeparator(.hidden, edges: .top)
                LibraryPathCell(path: .albums)
                LibraryPathCell(path: .playlists)
                LibraryPathCell(path: .artists)
            }
            
            Section("discover") {
                
            }
        }
        .listStyle(.plain)
        .background(Color.clear)
        .scrollIndicators(.hidden)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("EFFEM")
                    .font(.title2)
                    .bold()
            }
            
            ToolbarItem(placement: .topBarLeading) {
                Button("", systemImage: "slider.horizontal.3", action: openSettings)
            }
            
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button("", systemImage: "antenna.radiowaves.left.and.right", action: openLive)
                Button("", systemImage: "magnifyingglass", action: openSearch)
            }
        }
        .commonView()
    }
    
    private func openSettings() {
        state.openSettings()
    }
    
    private func openSearch() {
        state.sheet = .search
    }
    
    private func openLive() {
        state.fullScreenCover = .live
    }
}

fileprivate struct LibraryPathCell: View {
    var path: LibraryCategory
    
    var body: some View {
        NavigationLink(value: path) {
            VStack(alignment: .leading) {
                HStack {
                    path.image
                        .foregroundStyle(Color.accentColor)
                        .frame(width: 20)
                    Text(path.title)
                        .padding(.leading)
                }
                .font(.system(size: 20))
            }
            .frame(height: 44)
        }
        .listRowBackground(Color.primaryBackground)
    }
}

#Preview {
    MainPresenter()
        .environment(AppState())
        .environment(MediaPlaybackManager())
        .modelContainer(previewContainer)
}
