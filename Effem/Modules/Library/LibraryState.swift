//
//  LibraryState.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import Foundation
import SwiftUI

@Observable
class LibraryState {
    enum Path: Hashable {
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
    
    private unowned let parentState: AppState
    var path: [LibraryState.Path] = []
    var scrollToTop = false
    
    init(parentState: AppState) {
        self.parentState = parentState
    }
    
    func tabReSelected() {
        if path.count > 0 {
            path = []
        } else {
            scrollToTop.toggle()
        }
    }
}
