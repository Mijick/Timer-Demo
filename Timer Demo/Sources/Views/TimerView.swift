//
//  TimerView.swift of Timer Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickTimer

struct TimerView: View {
    
    var body: some View {
        VStack {
            
        }
    }
}


//struct TimerView: View {
//    @State private var currentTime: MTime = .init()
//    @State private var isTimerRunning: Bool = true
//    @State private var timerProgress: Double = 0
//
//
//    var body: some View {
//        VStack(spacing: 0) {
//            Spacer.height(8)
//            createNavigationBar()
//            Spacer()
//            createCounterText()
//            Spacer()
//            createButton()
//            Spacer.height(28)
//        }
//        .frame(maxWidth: .infinity)
//        .padding(.horizontal, margins)
//        .animation(.smooth, value: currentTime)
//        .animation(.smooth, value: isTimerRunning)
//        .animation(.smooth, value: timerProgress)
//        .onAppear(perform: onAppear)
//    }
//}
//private extension TimerView {
//    func createNavigationBar() -> some View {
//        NavigationBar(title: "To do something", time: startTime)
//    }
//    func createCounterText() -> some View {
//        Text(currentTime.toString())
//            .font(.mono(52))
//            .foregroundColor(.onBackgroundPrimary)
//            .contentTransition(.numericText(countsDown: true))
//    }
//    func createButton() -> some View {
//        CircleProgressButton(icon: buttonIcon, progress: timerProgress, action: onButtonTap)
//    }
//}
//
//private extension TimerView {
//    func onAppear() {
//        try! MTimer
//            .publish(every: 1, currentTime: $currentTime)
//            .bindTimerStatus(isTimerRunning: $isTimerRunning)
//            .bindTimerProgress(progress: $timerProgress)
//            .start(from: startTime, to: endTime)
//    }
//    func onButtonTap() {
//        switch isTimerRunning {
//            case true: MTimer.stop()
//            case false: try! MTimer.resume()
//        }
//    }
//}
//
//// MARK: - Timer Configuration
//private extension TimerView {
//    var startTime: MTime { .init(minutes: 21, seconds: 37) }
//    var endTime: MTime { .zero }
//}
//
//// MARK: - UI Configuration
//private extension TimerView {
//    var buttonIcon: String { isTimerRunning ? "icon.pause" : "icon.play" }
//    var margins: CGFloat { 24 }
//}
