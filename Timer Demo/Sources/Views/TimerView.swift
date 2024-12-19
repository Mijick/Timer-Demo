//
//  TimerView.swift
//  Timer Demo
//
//  Created by Alina Petrovska
//    - Mail: alina.petrovska@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2024 Mijick. All rights reserved.


import SwiftUI
import MijickTimer

struct TimerView: View {
    @StateObject private var timersHandler: TimersHandler = .init()
    
    var body: some View {
        VStack(spacing: 20) {
            createHeader()
            createScrollableContent()
            Spacer()
            createBrandView()
        }
        .padding(.horizontal, 16)
        .padding(.top, 32)
        .padding(.bottom, 12)
        .animation(.spring, value: timersHandler.timers.count)
        .animation(.default, value: isAvailableAddAction)
    }
}

private extension TimerView {
    func createHeader() -> some View {
        Text("Active Timers")
            .font(.h3)
            .foregroundStyle(Color.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    func createScrollableContent() -> some View {
        ScrollView {
            VStack(spacing: 4) {
                createTimerList()
                createAddButton()
            }
        }
    }
    func createBrandView() -> some View {
        Image(.madeBy)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 110.09)
    }
}

private extension TimerView {
    func createTimerList() -> some View {
        VStack(spacing: 4) {
            ForEach(0..<timersHandler.timers.count, id: \.self, content: createTimerView)
        }
    }
    func createAddButton() -> some View {
        PrimaryButton("", action: onAddTap)
            .setIcon(.addNew)
            .active(if: isAvailableAddAction)
    }
}

private extension TimerView {
    @ViewBuilder func createTimerView(_ item: Int) -> some View {
        if let timer = timersHandler.timers[safe: item] {
            TimerItem(timer: timer)
                .onTapGesture { onTimerItemTap(timer) }
        }
    }
}

private extension TimerView {
    func onAddTap() { timersHandler.addNewTimer() }
    func onTimerItemTap(_ item: MTimer) { TimerDetailView(item.id).present() }
}

private extension TimerView {
    var isAvailableAddAction: Bool { timersHandler.isAvailableAddAction }
}
