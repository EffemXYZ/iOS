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
        
        var id: Int { self.rawValue }
    }

    var route: Route = .main
    var tab: Tab = .library
    var sheet: Sheet? = nil
    
    
    public init() {}
    
    @ObservationIgnored
    lazy var homeState = HomeState(parentState: self)
    @ObservationIgnored
    lazy var liveState = LiveState(parentState: self)
    @ObservationIgnored
    lazy var searchState = SearchState(parentState: self)
    @ObservationIgnored
    lazy var libraryState = LibraryState(parentState: self)
    @ObservationIgnored
    lazy var settingsState = SettingsState(parentState: self)
    
    func openSettings() {
        sheet = .settings
    }
    
    func openNowPlaying() {
        sheet = .nowPlaying
    }
}
