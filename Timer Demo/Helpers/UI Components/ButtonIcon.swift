//
//  ButtonIcon.swift
//  Popups-Demo
//
//  Created by Alina Petrovska on 23.10.2024.
//    - Mail: alina.petrovskaya@mijick.com
//
//  Copyright ©2023 Mijick. Licensed under MIT License.
//

import SwiftUI

struct ButtonIcon: View, Configurable {
    private var config: Config = .init()
    private let image: ImageResource
    private let onAction: () -> Void
    
    init(_ image: ImageResource, _ onAction: @escaping () -> Void) {
        self.image = image
        self.onAction = onAction
    }
 
    var body: some View {
        Button(action: onAction, label: createLabel)
            .buttonStyle(.plain)
    }
}

private extension ButtonIcon {
    func createLabel() -> some View {
        Icon(image, size: 22, color: config.foregroundcolor)
            .padding(config.iconPadding)
            .rectangleBackground(.backgroundSecondary50, 12)
    }
}

//MARK: - Configurable Data
extension ButtonIcon {
    @MainActor struct Config {
        var foregroundcolor: Color = .textPrimary
        var iconPadding: CGFloat = 9
    }
    func setForegroundColor(_ value: Color) -> Self { configure(path: \.config.foregroundcolor, value) }
    func setIconPadding(_ value: CGFloat) -> Self { configure(path: \.config.iconPadding, value) }
}
