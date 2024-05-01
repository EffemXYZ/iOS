//
//  Song.swift
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
    @Attribute(.externalStorage) var onDisk: Data?
    
    init(name: String, duration: Double, streamURL: String, onDisk: Data? = nil) {
        self.name = name
        self.duration = duration
        self.streamURL = streamURL
        self.onDisk = onDisk
    }
}
