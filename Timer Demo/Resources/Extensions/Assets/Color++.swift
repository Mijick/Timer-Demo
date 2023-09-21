//
//  Color++.swift of Timer Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Color {
    static let backgroundPrimary: Color = .init(hex: 0x000000)

    static let onBackgroundPrimary: Color = .init(hex: 0xFFFFFF)
    static let onBackgroundSecondary: Color = .init(hex: 0x8E8E8E)
}

// MARK: - Initialisation with HEX value
fileprivate extension Color {
    init(hex: UInt) { self.init(.sRGB, red: Double((hex >> 16) & 0xff) / 255, green: Double((hex >> 08) & 0xff) / 255, blue: Double((hex >> 00) & 0xff) / 255, opacity: 1) }
}
