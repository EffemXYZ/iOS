//
//  LivePresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

@MainActor
struct LivePresenter: View {
    var body: some View {
        NavigationStack {
            LiveView()
        }
    }
}

@MainActor
fileprivate struct LiveView: View {
    var body: some View {
        Text("Live")
    }
}

#Preview {
    LivePresenter()
}
