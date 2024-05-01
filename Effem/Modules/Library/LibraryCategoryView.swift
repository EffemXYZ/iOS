//
//  LibraryCategoryView.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/26/24.
//

import SwiftUI
import SwiftData

enum LibraryCategory: Hashable {
    case playlists
    case artists
    case albums
    case songs
    
    var title: LocalizedStringResource {
        switch self {
        case .playlists: "Playlists"
        case .artists: "Artists"
        case .albums: "Albums"
        case .songs: "Songs"
        }
    }
    
    var searchPrompt: LocalizedStringResource {
        switch self {
        case .playlists: "Search Playlists"
        case .artists: "Search Artists"
        case .albums: "Search Albums"
        case .songs: "Search Songs"
        }
    }
    
    var image: Image {
        switch self {
        case .playlists: Image(systemName: "music.note.list")
        case .artists: Image(systemName: "music.mic")
        case .albums: Image(systemName: "square.stack")
        case .songs: Image(systemName: "music.note")
        }
    }
}

struct LibraryCategoryView: View {
    var type: LibraryCategory
    @State private var searchText = ""
    
    var body: some View {
        Group {
            switch type {
            case .playlists: PlaylistsListView()
            case .artists: ArtistsListView()
            case .albums: AlbumsListView()
            case .songs: SongsListView()
            }
        }
        .listStyle(.plain)
        .background(Color.clear)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: Text(type.searchPrompt))
        .navigationTitle("\(type.title)")
        .commonView()
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("", systemImage: "line.3.horizontal.circle", action: action)
            }
        }
    }
    
    private func action() {
        // TODO: this should take action on the LibraryPresenter
    }
}

fileprivate struct PlaylistsListView: View {
    var body: some View {
        List {
            PlaylistCell()
        }
    }
}

fileprivate struct PlaylistCell: View {
    var body: some View {
        Text("Playlist")
            .listRowBackground(Color.primaryBackground)
    }
}

fileprivate struct ArtistsListView: View {
    var body: some View {
        List {
            ArtistCell()
        }
    }
}

fileprivate struct ArtistCell: View {
    var body: some View {
        Text("Artist")
            .listRowBackground(Color.primaryBackground)
    }
}

fileprivate struct AlbumsListView: View {
    var body: some View {
        List {
            AlbumCell()
        }
    }
}

fileprivate struct AlbumCell: View {
    var body: some View {
        Text("Album")
            .listRowBackground(Color.primaryBackground)
    }
}

fileprivate struct SongsListView: View {
    @Query private var tracks: [Track]
    
    var body: some View {
        List {
            ForEach(tracks) {
                SongCell(track: $0)
            }
        }
    }
}

fileprivate struct SongCell: View {
    var track: Track
    
    var body: some View {
        Text(track.name)
            .listRowBackground(Color.primaryBackground)
    }
}

#Preview {
    NavigationStack {
        LibraryCategoryView(type: .songs)
    }
}
