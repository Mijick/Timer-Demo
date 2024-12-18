//
//  TimersHandler.swift
//  Timer Demo
//
//  Created by Alina Petrovska on 17.12.2024.
//

import SwiftUI
import MijickTimer

@MainActor class TimersHandler: ObservableObject {
    @Published var timers: [MTimer] = []
}

extension TimersHandler {
    func addNewTimer() {
        guard let timer = getNewTimer() else { return }
        timers.append(timer)
        run(timer)
    }
}

extension TimersHandler {
    var isAvailableAddAction: Bool { timers.count != ids.count }
}

private extension TimersHandler {
    func getNewTimer() -> MTimer? {
        guard let id = ids.first(where: { !timers.contains($0) }) else { return nil }
        return .init(id)
    }
    func run(_ timer: MTimer) {
        let time = getTimeConstraints()
        try? timer
                .publish(every: 1)
                .onTimerStatusChange { [weak self] in self?.onChange($0, of: timer) }
                .start(from: time.from, to: time.to)
    }
}

private extension TimersHandler {
    func onChange(_ status: MTimerStatus, of timer: MTimer) {
        switch status {
            case .notStarted, .finished: timers.removeAll(where: { $0.id == timer.id })
            default: break
        }
    }
    func getTimeConstraints() -> (from: TimeInterval, to: TimeInterval) {
        let from: TimeInterval = 0
        let to = TimeInterval((10...360).randomElement() ?? 10)
        let startRandomizer = [0, 1].randomElement() ?? 0
        return startRandomizer == 0 ? (from, to) : (to, from)
    }
}

private extension TimersHandler {
    var ids: [MTimerID] {[
        .teaBreak, .spaghettiCocking, .breakfast, .eggsBoiling, .coffeeBreak, .cakeBreak, .muffinBreak
    ]}
}

// MARK: Helpers
fileprivate extension [MTimer] {
    @MainActor func contains(_ id: MTimerID) -> Bool { contains(where: { $0.id == id }) }
}
