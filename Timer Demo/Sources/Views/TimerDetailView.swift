//
//  TimerDetailView.swift
//  Timer Demo
//
//  Created by Alina Petrovska on 18.12.2024.
//

import SwiftUI
import MijickTimer
import MijickPopups

struct TimerDetailView: BottomPopup {
    @ObservedObject private var timer: MTimer
    @State var isAnimating: Bool = false
    
    init(_ timerID: MTimerID) {
        timer = .init(timerID)
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            createLogoView()
            createTimerDataView()
        }
        .padding()
        .animation(.default, value: timer.timerTime.toString())
        .onChange(of: timer.timerStatus) { _, _ in onTimerstatusChange() }
        .onAppear { isAnimating = timer.timerStatus == .running }
    }
    func configurePopup(config: BottomPopupConfig) -> BottomPopupConfig {
        config
            .heightMode(.fullscreen)
            .enableDragGesture(false)
    }
}

private extension TimerDetailView {
    func createLogoView() -> some View {
        LogoView(isAnimating: $isAnimating)
    }
    func createTimerDataView() -> some View {
        VStack(spacing: 0) {
            Spacer()
            createTimerName()
            createTimerTimeView()
            createControlButtons()
            createCloseButton()
        }
    }
}

private extension TimerDetailView {
    func createTimerName() -> some View {
        Text(timer.id.rawValue)
            .font(.mediumRegular)
            .foregroundStyle(Color.textPrimary)
            .padding(.bottom, 4)
    }
    func createTimerTimeView() -> some View {
        Text(timer.timerTime.toString(getFormatter))
            .font(.h1)
            .foregroundStyle(Color.textPrimary)
            .padding(.bottom, 16)
            .contentTransition(.numericText())
    }
    func createControlButtons() -> some View {
        HStack(spacing: 12) {
            createStopButton()
            createPauseButton()
            createSkipButton()
        }
        .padding(.bottom, 12)
    }
    func createCloseButton() -> some View {
        PrimaryButton("Close", action: onCloseTap)
            .changeAppearance(to: .transparent)
            .frame(width: 180)
    }
}

private extension TimerDetailView {
    func createStopButton() -> some View {
        ButtonIcon(.stop, onCancelTap).setIconPadding(15)
    }
    func createPauseButton() -> some View {
        ButtonIcon(pauseIcon, onPauseTap)
            .setIconPadding(15)
            .active(if: isVisiblePauseButton)
    }
    func createSkipButton() -> some View {
        ButtonIcon(.skip, onSkipTap).setIconPadding(15)
    }
}

private extension TimerDetailView {
    func getFormatter(_ formatter: DateComponentsFormatter) -> DateComponentsFormatter {
        formatter.allowedUnits = [.minute, .second]
        return formatter
    }
    func onCancelTap() {
        timer.cancel()
        onCloseTap()
    }
    func onPauseTap() {
        switch timer.timerStatus {
            case .paused: try? timer.resume()
            default: timer.pause()
        }
    }
    func onSkipTap() {
        try? timer.skip()
    }
    func onCloseTap() { Task {
       await dismissLastPopup()
    }}
    func onTimerstatusChange() {
        isAnimating = timer.timerStatus == .running
    }
}

private extension TimerDetailView {
    var pauseIcon: ImageResource { timer.timerStatus == .paused ? .play : .pause }
    var isVisiblePauseButton: Bool { timer.timerStatus == .paused || timer.timerStatus == .running }
}
