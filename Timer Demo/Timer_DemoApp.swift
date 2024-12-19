//
//  Timer_DemoApp.swift of Timer Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickPopups

@main struct Timer_DemoApp: App {
    var body: some Scene { WindowGroup {
        TimerView()
            .preferredColorScheme(.dark)
            .registerPopups() {
                $0.vertical {
                    $0.backgroundColor(.backgroundPrimary)
                }
            }
    }}
}
