//
//  SearchState.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import Foundation

@Observable
class SearchState {
    private unowned let parentState: AppState
    
    init(parentState: AppState) {
        self.parentState = parentState
    }
}
