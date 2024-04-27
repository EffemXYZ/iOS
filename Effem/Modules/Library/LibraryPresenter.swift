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
                .navigationDestination(for: LibraryCategory.self) {
                    LibraryCategoryView(type: $0)
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
        .listStyle(.plain)
        .background(Color.clear)
        .scrollIndicators(.hidden)
        .scrollableToTop(scrollToTop: $state.scrollToTop, topID: topID)
        .navigationTitle("Library")
        .settingsInNavBar()
        .commonView()
    }
}

@MainActor
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
        }
        .listRowBackground(Color.primaryBackground)
    }
}

#Preview {
    LibraryPresenter()
        .environment(AppState())
        .environment(LibraryState(parentState: .init()))
}
