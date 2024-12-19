//
//  TimerIdType.swift
//  Timer Demo
//
//  Created by Alina Petrovska
//    - Mail: alina.petrovska@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2024 Mijick. All rights reserved.

import Foundation
import MijickTimer

enum TimerIdType: CaseIterable {
    case teaBreak
    case spaghettiCocking
    case breakfast
    case eggsBoiling
    case coffeeBreak
    case cakeBreak
    case muffinBreak
}

extension TimerIdType {
    var id: MTimerID {
        switch self {
            case .teaBreak: .init(rawValue: "Tea Break")
            case .spaghettiCocking: .init(rawValue: "Spaghetti Cocking")
            case .breakfast: .init(rawValue: "Breakfast")
            case .eggsBoiling: .init(rawValue: "Eggs Boiling")
            case .coffeeBreak: .init(rawValue: "Coffee Break")
            case .cakeBreak: .init(rawValue: "Cake Break")
            case .muffinBreak: .init(rawValue: "Muffin Break")
        }
    }
}
