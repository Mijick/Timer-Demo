//
//  PrimaryButton.Appearance.swift
//  Timer Demo
//
//  Created by Alina Petrovska
//    - Mail: alina.petrovska@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2024 Mijick. All rights reserved.

import SwiftUI

extension PrimaryButton {
    @MainActor enum Appearance { case accented, transparent }
}

extension PrimaryButton.Appearance {
    var backgroundColor: Color {
        switch self {
            case .accented: .backgroundBrand
            case .transparent: .clear
        }
    }
    var textColour: Color {
        switch self {
            case .accented: .textPrimary
            case .transparent: .textPrimary
        }
    }
    var borderColor: Color? {
        switch self {
            case .accented: nil
            case .transparent: .borderTertiary
        }
    }
    var cornerRadius: CGFloat {
        switch self {
            case .accented: 10
            case .transparent: 12
        }
    }
}
