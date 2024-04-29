//
//  Build+Constants.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/28/24.
//

import Foundation

extension Build {
    struct Constants {
        struct UserDefault {
            static let colorScheme = "xyz.effem.effem.userDefaults.colorScheme"
            static let lightThemeColor = "xyz.effem.effem.userDefaults.lightThemeColor"
            static let darkThemeColor = "xyz.effem.effem.userDefaults.darkThemeColor"
        }
        
        struct Theme {
            static let light = "xyz.effem.effem.theme.light"
            static let dark = "xyz.effem.effem.theme.dark"
        }
    }
}
