//
//  SearchPresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

@MainActor
struct SearchPresenter: View {
    var body: some View {
        NavigationStack {
            SearchView()
        }
    }
}

@MainActor
fileprivate struct SearchView: View {
    var body: some View {
        Text("Search")
    }
}

#Preview {
    SearchPresenter()
}
