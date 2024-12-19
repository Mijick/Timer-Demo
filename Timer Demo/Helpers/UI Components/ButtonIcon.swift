//
//  ButtonIcon.swift
//  Timer Demo
//
//  Created by Alina Petrovska
//    - Mail: alina.petrovska@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2024 Mijick. All rights reserved.

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
