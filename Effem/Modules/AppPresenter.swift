//
//  AppPresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

struct AppPresenter: View {
    @Environment(AppState.self) private var state
    @Environment(\.modelContext) private var context
    
    var body: some View {
        switch state.route {
        case .main:
            MainPresenter()
                .onAppear {
                    #warning("THIS IS FOR DEMO ONLY")
                    let artist = Artist(name: "Matchbox Twenty", image: "https://variety.com/wp-content/uploads/2023/04/Matchbox-Twenty-2023-credit-Jimmy-Fontaine.jpg?w=1000&h=562&crop=1")
                    let album = Album(name: "Yourself or Someone Like You", releaseDate: .now, image: "https://upload.wikimedia.org/wikipedia/en/4/4e/Matchbox_Twenty_-_Yourself_or_Someone_Like_You.jpg")
                    let trackOne = Track(name: "3 am", duration: 226, streamURL: "", artist: artist, album: album)
                    context.insert(trackOne)
                    try? context.save()
                }
        }
    }
}

#Preview {
    AppPresenter()
        .environment(AppState())
        .environment(MediaPlaybackManager())
}
