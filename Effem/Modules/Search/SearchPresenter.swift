//
//  SearchPresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

struct SearchPresenter: View {
    var body: some View {
        NavigationStack {
            SearchView()
        }
    }
}

fileprivate struct SearchView: View {
    var body: some View {
        Text("Search")
    }
}

#Preview {
    SearchPresenter()
}
