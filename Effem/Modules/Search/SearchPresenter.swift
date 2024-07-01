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
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text("Search")
            .commonView()
            .navigationTitle("search")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done", action: { dismiss() })
                }
            }
    }
}

#Preview {
    Text("EFFEM")
        .sheet(isPresented: .constant(true)) {
            SearchPresenter()
                .environment(SearchState(parentState: .init()))
        }
}
