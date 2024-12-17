//
//  View++.swift of Timer Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

// MARK: - Helpers
extension View {
    func frame(_ size: CGFloat) -> some View { frame(width: size, height: size, alignment: .center) }
    func font(_ type: CustomFont) -> some View { ModifiedContent(content: self, modifier: type) }
}

extension View {
    func rectangleBackground(_ color: Color, _ radius: CGFloat, borderColor: Color? = nil) -> some View {
        background {
            RoundedRectangle(cornerRadius: radius)
                .stroke(borderColor ?? .clear, lineWidth: 1)
                .background { RoundedRectangle(cornerRadius: radius).fill(color) }
        }
    }
}
