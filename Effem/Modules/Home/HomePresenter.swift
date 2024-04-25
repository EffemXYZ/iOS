//
//  HomePresenter.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import SwiftUI

@MainActor
struct HomePresenter: View {
    var body: some View {
        NavigationStack {
            HomeView()
        }
    }
}

@MainActor
fileprivate struct HomeView: View {
    var body: some View {
        Text("Home")
    }
}

#Preview {
    HomePresenter()
}
