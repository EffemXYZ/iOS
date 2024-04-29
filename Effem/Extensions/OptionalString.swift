//
//  OptionalString.swift
//  Effem
//
//  Created by Thomas Rademaker on 4/28/24.
//

import SwiftUI

extension String? {
    var color: Color {
        guard let self,
              let colorData = self.data(using: .utf8),
              let colorResolved = try? JSONDecoder().decode(Color.Resolved.self, from: colorData) else { return .accent }
        return Color(colorResolved)
    }
}
