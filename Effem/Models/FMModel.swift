//
//  FMModel.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/30/24.
//

import SwiftUI
import SwiftData

struct EffemDataContainerViewModifier: ViewModifier {
    let container: ModelContainer
    
    init(inMemory: Bool) {
        do {
            container = try ModelContainer(for: Track.self, Artist.self, Album.self, configurations: ModelConfiguration(isStoredInMemoryOnly: inMemory))
        } catch {
            fatalError("Failed to create ModelContainer")
        }
    }
    
    func body(content: Content) -> some View {
        content
            .modelContainer(container)
    }
}

class FMModelOptions {
    #if DEBUG
    public static let inMemoryPersistence = true
    #else
    public static let inMemoryPersistence = false
    #endif
}

extension View {
    func setupModel(inMemory: Bool = FMModelOptions.inMemoryPersistence) -> some View {
        modifier(EffemDataContainerViewModifier(inMemory: inMemory))
    }
}

