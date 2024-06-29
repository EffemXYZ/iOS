//
//  AppPresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

struct AppPresenter: View {
    @Environment(AppState.self) private var state
    
    var body: some View {
        switch state.route {
        case .main:
            MainPresenter()
        }
    }
}

#Preview {
    AppPresenter()
        .environment(AppState())
        .environment(MediaPlaybackManager())
}
