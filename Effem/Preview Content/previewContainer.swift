//
//  previewContainer.swift
//  Effem
//
//  Created by Thomas Rademaker on 5/4/24.
//

import Foundation
import SwiftData

//#if DEBUG
@MainActor
public let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Track.self, Artist.self, Album.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
//        let trackOne = Track(name: "one", duration: 123, streamURL: "", artist: Artist(name: "Tom", image: "", albums: [], tracks: []), album: Album(name: "", releaseDate: .now, image: "", artist: Artist(name: "", image: "", albums: [], tracks: []), tracks: []))
        
        let artist = Artist(name: "Matchbox Twenty", image: "https://variety.com/wp-content/uploads/2023/04/Matchbox-Twenty-2023-credit-Jimmy-Fontaine.jpg?w=1000&h=562&crop=1")
        let album = Album(name: "Yourself or Someone Like You", releaseDate: .now, image: "https://upload.wikimedia.org/wikipedia/en/4/4e/Matchbox_Twenty_-_Yourself_or_Someone_Like_You.jpg")
        let trackOne = Track(name: "3 am", duration: 226, streamURL: "", artist: artist, album: album)
        container.mainContext.insert(trackOne)
        try container.mainContext.save()
        
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
//#endif
