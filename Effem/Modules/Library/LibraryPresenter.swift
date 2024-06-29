//
//  LibraryPresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

struct LibraryPresenter: View {
    @Environment(LibraryState.self) private var state
    
    var body: some View {
        @Bindable var state = state
        
        NavigationStack(path: $state.path) {
            LibraryView()
                .navigationDestination(for: LibraryCategory.self) {
                    LibraryCategoryView(type: $0)
                }
        }
    }
}

fileprivate struct LibraryView: View {
    @Environment(AppState.self) private var appState
    // TODO: with UI change, does LibraryState need to exist?
    @Environment(LibraryState.self) private var state
    @Namespace private var topID
    
    var body: some View {
        @Bindable var state = state
        List {
            LibraryPathCell(path: .songs)
                .listRowSeparator(.hidden, edges: .top)
                .id(topID)
            LibraryPathCell(path: .albums)
            LibraryPathCell(path: .playlists)
            LibraryPathCell(path: .artists)
            
            // TODO: This is actually going to become discoverable content
            Section("Recently Played") {
                
            }
        }
        .listStyle(.plain)
        .background(Color.clear)
        .scrollIndicators(.hidden)
        .scrollableToTop(scrollToTop: $state.scrollToTop, topID: topID)
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
        }
        .settingsInNavBar()
        .commonView()
    }
    
    private func openSettings() {
        appState.openSettings()
    }
}

fileprivate struct LibraryPathCell: View {
    @Environment(LibraryState.self) private var state
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
    LibraryPresenter()
        .environment(AppState())
        .environment(LibraryState(parentState: .init()))
}
