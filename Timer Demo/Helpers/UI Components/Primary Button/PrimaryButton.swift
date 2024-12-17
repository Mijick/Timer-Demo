//
//  PrimaryButton.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

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
        Image(icon)
            .foregroundColor(.neutralWhite)
            .frame(28)
    }
    func createText() -> some View {
        Text(text)
            .font(.medium)
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
