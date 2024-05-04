//
//  Track.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/30/24.
//

import Foundation
import SwiftData

@Model
class Track {
    let name: String
    let duration: Double
    let streamURL: String
    @Relationship(.unique, deleteRule: .cascade, inverse: \Artist.tracks) let artist: Artist
    @Relationship(.unique, deleteRule: .cascade, inverse: \Album.tracks) let album: Album
    @Attribute(.externalStorage) var onDisk: Data?
    
    init(name: String, duration: Double, streamURL: String, artist: Artist, album: Album, onDisk: Data? = nil) {
        self.name = name
        self.duration = duration
        self.streamURL = streamURL
        self.artist = artist
        self.album = album
        self.onDisk = onDisk
    }
}
