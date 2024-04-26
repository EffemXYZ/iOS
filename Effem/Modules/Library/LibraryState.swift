//
//  LibraryState.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import Foundation

@Observable
class LibraryState {
    
    
    private unowned let parentState: AppState
    var path: [LibraryCategory] = []
    var scrollToTop = false
    
    init(parentState: AppState) {
        self.parentState = parentState
    }
    
    func tabReSelected() {
        if path.count > 0 {
            path = []
        } else {
            scrollToTop.toggle()
        }
    }
}
