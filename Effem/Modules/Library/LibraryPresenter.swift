//
//  LibraryPresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

@MainActor
struct LibraryPresenter: View {
    var body: some View {
        NavigationStack {
            LibraryView()
        }
    }
}

@MainActor
fileprivate struct LibraryView: View {
    var body: some View {
        Text("Library")
    }
}

#Preview {
    LibraryPresenter()
}
