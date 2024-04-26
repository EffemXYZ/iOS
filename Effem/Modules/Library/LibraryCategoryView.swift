//
//  LibraryCategoryView.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/26/24.
//

import SwiftUI

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
    
    var body: some View {
        Text(type.title)
    }
}

#Preview {
    NavigationStack {
        LibraryCategoryView(type: .songs)
    }
}
