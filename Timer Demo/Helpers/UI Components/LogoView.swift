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
                .onChange(of: isAnimating) { onAnimatingStatusChanged($1) }
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
        animationTimer.cancel()
    }
    func onAnimatingStatusChanged(_ value: Bool) {
        switch value {
            case true: try? animationTimer.start()
            case false: onAnimationStop()
        }
    }
    func onTimerCall(_ time: MTime) {
        guard isAnimating else { return }
        withAnimation { degree -= 3 }
    }
    func onAnimationStop() {
        animationTimer.cancel()
        withAnimation(.interpolatingSpring(duration: 1, bounce: 0, initialVelocity: 0)) {
            guard Int(degree) % 90 != 0 else { return }
            let numberOfCircles = Int(abs(degree) / 90) + 1
            degree = -Double(numberOfCircles * 90)
        }
    }
}

#Preview {
    try? MTimer(.breakfast).publish(every: 1).start()
    return TimerDetailView(.breakfast)
}
