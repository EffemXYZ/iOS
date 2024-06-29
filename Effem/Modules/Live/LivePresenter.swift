//
//  LivePresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

struct LivePresenter: View {
    
    var body: some View {
        NavigationStack {
            LiveView()
        }
    }
}

fileprivate struct LiveView: View {
    @Environment(LiveState.self) private var state
    
    var body: some View {
        Text("Live")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "xmark", action: dismiss)
                }
            }
    }
    
    private func dismiss() {
        state.dismiss()
    }
}

#Preview {
    LivePresenter()
}
