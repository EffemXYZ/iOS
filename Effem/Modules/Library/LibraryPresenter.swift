//
//  LibraryPresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

@MainActor
struct LibraryPresenter: View {
    @Environment(LibraryState.self) private var state
    
    var body: some View {
        @Bindable var state = state
        
        NavigationStack(path: $state.path) {
            LibraryView()
                .navigationDestination(for: LibraryState.Path.self) {
                    switch $0 {
                    case .playlists:
                        Text("PLAYLISTS")
                    case .artists:
                        Text("ARTISTS")
                    case .albums:
                        Text("ALBUMS")
                    case .songs:
                        Text("SONGS")
                    }
                }
        }
    }
}

@MainActor
fileprivate struct LibraryView: View {
    @Environment(LibraryState.self) private var state
    @Namespace private var topID
    
    var body: some View {
        @Bindable var state = state
        List {
            LibraryPathCell(path: .songs)
                .id(topID)
            LibraryPathCell(path: .albums)
            LibraryPathCell(path: .playlists)
            LibraryPathCell(path: .artists)
            
            Section("Recently Played") {
                
            }
        }
        .listStyle(.grouped)
        .scrollIndicators(.hidden)
        .scrollableToTop(scrollToTop: $state.scrollToTop, topID: topID)
        .navigationTitle("Library")
//        .commonView()
//        .navBar(title: "Library")
    }
}

@MainActor
fileprivate struct LibraryPathCell: View {
    @Environment(LibraryState.self) private var state
    var path: LibraryState.Path
    
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
    }
}

#Preview {
    LibraryPresenter()
        .environment(LibraryState(parentState: .init()))
}
