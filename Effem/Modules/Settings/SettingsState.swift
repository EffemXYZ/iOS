//
//  SettingsState.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import Foundation

@Observable
class SettingsState {
    enum NavigationLink: Hashable {
        case about
        case privacy
        case artistInfo
    }
    
    private unowned let parentState: AppState
    var path: [SettingsState.NavigationLink] = []
    var presentLogoutDialog = false
    
    init(parentState: AppState) {
        self.parentState = parentState
    }
    
    func logout() {
//        presentLogoutDialog = false
//        parentState.logout()
    }
}
