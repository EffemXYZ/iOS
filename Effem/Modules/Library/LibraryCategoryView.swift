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
    @Query private var artists: [Artist]
    
    var body: some View {
        if artists.isEmpty {
            ContentUnavailableView("no artists in library", systemImage: "waveform.slash")
        } else {
            List {
                ArtistCell()
            }
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
    @Query private var albums: [Album]
    
    var body: some View {
        if albums.isEmpty {
            ContentUnavailableView("no albums in library", systemImage: "square.stack.3d.up.slash")
        } else {
            List {
                AlbumCell()
            }
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
        if tracks.isEmpty {
            ContentUnavailableView("no songs in library", systemImage: "waveform.slash")
        } else {
            List {
                ForEach(tracks) {
                    SongCell(track: $0)
                }
            }
        }
    }
}

fileprivate struct SongCell: View {
    var track: Track
    
    var body: some View {
        Button(action: playTrack) {
            HStack {
                AsyncImage(url: URL(string: track.album.image), content: {
                    $0
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }, placeholder: {
                    Image(systemName: "person.2.crop.square.stack")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                })
                
                VStack(alignment: .leading) {
                    Text(track.name)
                        .font(.title3)
                    Text(track.artist.name)
                        .font(.subheadline)
                }
                // TODO: set text color with foregroundStyle
            }
        }
        .listRowBackground(Color.primaryBackground)
    }
    
    private func playTrack() {
        print("play")
    }
}

#Preview {
    NavigationStack {
        LibraryCategoryView(type: .songs)
            .modelContainer(previewContainer)
    }
}
