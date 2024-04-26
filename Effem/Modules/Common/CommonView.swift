//
//  CommonView.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/26/24.
//

import SwiftUI

@MainActor
fileprivate struct CommonView: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.primaryBackground
                .ignoresSafeArea()
            content
        }
    }
}

extension View {
    @MainActor
    func commonView() -> some View {
        modifier(CommonView())
    }
}

#Preview {
    Text("common view")
        .commonView()
        .foregroundStyle(.black)
}
