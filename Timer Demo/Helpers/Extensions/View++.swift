//
//  View++.swift
//  Timer Demo
//
//  Created by Alina Petrovska
//    - Mail: alina.petrovska@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import SwiftUI
import MijickPopups

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

extension View {
    @ViewBuilder func active(if condition: Bool) -> some View {
        if condition { self }
    }
}

extension View where Self: BottomPopup {
    func present() { Task { await present() }}
}

