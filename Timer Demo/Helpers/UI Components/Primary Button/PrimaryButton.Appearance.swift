//
//  PrimaryButton.Appearance.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

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
