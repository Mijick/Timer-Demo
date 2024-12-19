//
//  PrimaryButton.swift
//  Timer Demo
//
//  Created by Alina Petrovska
//    - Mail: alina.petrovska@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2024 Mijick. All rights reserved.

import SwiftUI

struct PrimaryButton: View, Configurable {
    private var config: Config = .init()
    let text: String
    let action: () -> ()

    init(_ text: String, action: @escaping () -> ()) {
        self.text = text
        self.action = action
    }
    var body: some View {
        Button(action: action, label: createButtonLabel).buttonStyle(Style())
    }
}

private extension PrimaryButton {
    func createButtonLabel() -> some View {
        createBody()
            .frame(maxWidth: .infinity)
            .frame(height: config.height)
            .rectangleBackground(config.backgroundColor, config.cornerRadius, borderColor: config.borderColor)
    }
}

private extension PrimaryButton {
    @ViewBuilder func createBody() -> some View {
        switch config.icon {
            case .some(let icon): createIcon(icon)
            default: createText()
        }
    }
}

private extension PrimaryButton {
    func createIcon(_ icon: ImageResource) -> some View {
        Icon(icon, size: 28, color: .neutralWhite)
    }
    func createText() -> some View {
        Text(text)
            .font(.mediumBold)
            .foregroundColor(config.appearance.textColour)
            .animation(nil, value: text)
    }
}

//MARK: - Configurable Data
extension PrimaryButton {
    @MainActor struct Config {
        var icon: ImageResource? = nil
        var appearance: Appearance = .accented
        var height: CGFloat = 52
        var cornerRadius: CGFloat { appearance.cornerRadius }
        var backgroundColor: Color { appearance.backgroundColor }
        var borderColor: Color? { appearance.borderColor }
    }
    
    func changeAppearance(to appearance: Appearance) -> Self { configure(path: \.config.appearance, appearance) }
    func setIcon(_ value: ImageResource) -> Self { configure(path: \.config.icon, value) }
}

// MARK: - Style
fileprivate extension PrimaryButton {
    struct Style: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.99 : 1)
                .saturation(configuration.isPressed ? 0.5 : 1)
        }
    }
}
