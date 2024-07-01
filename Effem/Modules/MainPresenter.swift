//
//  MainPresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

struct MainPresenter: View {
    @Environment(AppState.self) private var state
    @Environment(MediaPlaybackManager.self) private var mediaPlaybackManager
    
    var body: some View {
        @Bindable var state = state
        
        NavigationStack(path: $state.path) {
            ZStack {
                MainView()
                    .navigationDestination(for: LibraryCategory.self) {
                        LibraryCategoryView(type: $0)
                    }
                
                if let _ = mediaPlaybackManager.currentTrack {
                    NowPlayingBar()
                }
                
                // TODO: throw the music bar here
            }
            .commonView()
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

fileprivate struct NowPlayingBar: View {
    @Environment(AppState.self) private var state
    @Environment(MediaPlaybackManager.self) private var mediaPlaybackManager
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                CommonImage(image: .url(url: mediaPlaybackManager.currentTrack?.album.image ?? "", sfSymbol: "music.quarternote.3"))
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .frame(width: 40, height: 40)
                
                Text(mediaPlaybackManager.currentTrack?.name ?? "")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.black)
                
                Spacer()
                
                Button(action: playPause) {
                    Image(systemName: mediaPlaybackManager.isPlaying ? "pause.rectangle.fill" : "play.fill")
                        .font(.title2)
                        .foregroundStyle(.black)
                        .frame(width: 20)
                        .padding(.horizontal)
                }
                
                Image(systemName: "forward.end.fill")
                    .font(.title2)
                    .foregroundStyle(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8.0)
                    .fill(.white)
            )
            .padding(.horizontal)
            .contentShape(Rectangle())
            .onTapGesture(perform: openNowPlayingView)
        }
    }
    
    private func openNowPlayingView() {
        state.sheet = .nowPlaying
    }
    
    private func playPause() {
        
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
