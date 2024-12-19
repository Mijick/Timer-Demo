//
//  CustomFont.swift
//  Timer Demo
//
//  Created by Alina Petrovska
//    - Mail: alina.petrovska@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2024 Mijick. All rights reserved.

import SwiftUI

struct CustomFont: ViewModifier {
    private let font: Font
    private let lineHeight: CGFloat
    private let fontHeight: CGFloat
    private let kerning: CGFloat
    
    init(_ weight: Font.Weight, size: CGFloat, lineHeight: CGFloat, kerning: CGFloat) {
        self.font = .init(weight, size: size)
        self.lineHeight = lineHeight
        self.fontHeight = size
        self.kerning = kerning
    }
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .tracking(kerning)
            .lineSpacing(spacing)
            .padding(.vertical, padding)
    }
}

private extension CustomFont {
    var calculatedLineHeight: CGFloat { lineHeight - fontHeight - 3 }
    var spacing: CGFloat { calculatedLineHeight < 0 ? 0 : calculatedLineHeight }
    var padding: CGFloat { spacing / 2 }
}

// MARK: Header
extension CustomFont {
    static var h1: CustomFont { .init(.bold, size: 48, lineHeight: 58, kerning: -0.32) }
    static var h3: CustomFont { .init(.bold, size: 32, lineHeight: 38, kerning: -0.32) }
    static var h4: CustomFont { .init(.bold, size: 28, lineHeight: 32, kerning: -0.28) }
}

// MARK: Body
extension CustomFont {
    static var mediumBold: CustomFont { .init(.bold, size: 16, lineHeight: 24, kerning: -0.16) }
    static var mediumRegular: CustomFont { .init(.regular, size: 16, lineHeight: 24, kerning: -0.16) }
}
