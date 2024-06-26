//
//  Album.swift
//  Effem
//
//  Created by Thomas Rademaker on 5/4/24.
//

import Foundation
import SwiftData

@Model
class Album {
    let name: String
    let releaseDate: Date
    let image: String
    let tracks: [Track]?
    
    init(name: String, releaseDate: Date, image: String) {
        self.name = name
        self.releaseDate = releaseDate
        self.image = image
    }
}

