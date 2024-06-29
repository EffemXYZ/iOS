//
//  AppState.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/25/24.
//

import Foundation
import SwiftData

@Observable
public class AppState {
    enum Route {
        case main
    }
    
    enum Tab {
        case home
        case live
        case library
        case search
    }
    
    enum Sheet: Int, Identifiable {
        case nowPlaying
        case settings
        case search
        
        var id: Int { rawValue }
    }
    
    enum FullScreenCover: Int, Identifiable {
        case live
        
        var id: Int { rawValue }
    }

    var route: Route = .main
    var tab: Tab = .library {
        didSet { tabChanged(oldValue: oldValue, newValue: tab) }
    }
    
    var sheet: Sheet?
    var fullScreenCover: FullScreenCover?
    var path: [LibraryCategory] = []
    
    public init() {}
    
    @ObservationIgnored
    lazy var liveState = LiveState(parentState: self)
    @ObservationIgnored
    lazy var searchState = SearchState(parentState: self)
    @ObservationIgnored
    lazy var settingsState = SettingsState(parentState: self)
    
    func openSettings() {
        sheet = .settings
    }
    
    func openNowPlaying() {
        sheet = .nowPlaying
    }
    
    private func tabChanged(oldValue: Tab, newValue: Tab) {
        guard newValue == oldValue else { return }
        
        switch newValue {
        case .home:
            break
        case .live:
            break
        case .library:
//            libraryState.tabReSelected()
            break
        case .search:
            break
        }
    }
}
