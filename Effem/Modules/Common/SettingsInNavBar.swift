//
//  SettingsInNavBar.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/27/24.
//

import SwiftUI

@MainActor
fileprivate struct SettingsInNavBar: ViewModifier {
    @Environment(AppState.self) private var state
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("", systemImage: "slider.horizontal.3", action: openSettings)
                }
            }
    }
    
    private func openSettings() {
        state.openSettings()
    }
}

extension View {
    @MainActor
    func settingsInNavBar() -> some View {
        modifier(SettingsInNavBar())
    }
}

#Preview {
    NavigationStack {
        Text("my view")
            .settingsInNavBar()
    }
    .environment(AppState())
}