//
//  SettingsPresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

@MainActor
struct SettingsPresenter: View {
    var body: some View {
        NavigationStack {
            SettingsView()
        }
    }
}

@MainActor
fileprivate struct SettingsView: View {
    var body: some View {
        Text("Settings")
    }
}

#Preview {
    SettingsPresenter()
}
