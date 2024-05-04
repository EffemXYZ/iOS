//
//  Artist.swift
//  Effem
//
//  Created by Thomas Rademaker on 5/4/24.
//

import Foundation
import SwiftData

@Model
class Artist {
    let name: String
    let image: String
    let albums: [Album]?
    let tracks: [Track]?
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
