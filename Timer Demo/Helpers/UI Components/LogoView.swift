//
//  LogoView.swift
//  Timer Demo
//
//  Created by Alina Petrovska on 18.12.2024.
//

import SwiftUI
import MijickTimer

struct LogoView: View {
    private let animationTimer = MTimer(.logoAnimation)
    @State private var degree: Double = 0
    @Binding var isAnimating: Bool
    
    var body: some View {
        VStack {
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(140)
                .rotationEffect(.degrees(degree))
                .onAppear(perform: onAppear)
        }
    }
}

private extension LogoView {
    func onAppear() {
        try? animationTimer
            .publish(every: 0.1, onTimerCall)
            .start()
    }
    func onDisappear() {
        isAnimating = false
        animationTimer.cancel()
    }
    func onTimerCall(_ time: MTime) {
        guard isAnimating else { return }
        withAnimation { degree += 3 }
    }
}
