//
//  TimerItem.swift
//  Timer Demo
//
//  Created by Alina Petrovska on 17.12.2024.
//

import SwiftUI
import MijickTimer

struct TimerItem: View {
    @ObservedObject var timer: MTimer
    
    var body: some View {
        HStack(spacing: 8) {
            createTextView()
            createButtonsView()
        }
        .padding(.leading, 20)
        .padding(.trailing, 16)
        .padding(.vertical, 12)
        .rectangleBackground(.backgroundSecondary50, 12)
    }
}

private extension TimerItem {
     func createTextView() -> some View {
         VStack(spacing: 4) {
             createTimeView()
             createNameView()
         }
    }
    func createButtonsView() -> some View {
        HStack(spacing: 8) {
            createPauseButtonView()
            createStopButtonView()
        }
    }
}

private extension TimerItem {
    func createTimeView() -> some View {
        Text(timer.timerTime.toString(getFormatter))
            .font(.h4)
            .foregroundStyle(Color.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    func createNameView() -> some View {
        Text(timer.id.rawValue)
            .font(.mediumRegular)
            .foregroundStyle(Color.textTertiary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    func createPauseButtonView() -> some View {
        ButtonIcon(timer.timerStatus == .paused ? .play : .pause, onPauseButtonTap)
            .frame(40)
    }
    func createStopButtonView() -> some View {
        ButtonIcon(.stop, onStopButtonTap)
            .setForegroundColor(.textQuaternary)
            .frame(40)
    }
}

private extension TimerItem {
    func getFormatter(_ formatter: DateComponentsFormatter) -> DateComponentsFormatter {
        formatter.allowedUnits = [.minute, .second]
        return formatter
    }
    func onPauseButtonTap() {
        switch timer.timerStatus {
            case .paused: try? timer.resume()
            default: timer.pause()
        }
    }
    func onStopButtonTap() {
        timer.cancel()
    }
}
