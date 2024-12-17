//
//  CircleProgressButton.swift of Timer Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

//struct CircleProgressButton: View {
//    let icon: String
//    let progress: Double
//    let action: () -> ()
//
//
//    var body: some View {
//        ZStack {
//            createBackground()
//            createIcon()
//        }
//        .onTapGesture(perform: action)
//    }
//}
//private extension CircleProgressButton {
//    func createBackground() -> some View {
//        Circle()
//            .trim(from: 0, to: 1 - progress)
//            .stroke(Color.onBackgroundPrimary, lineWidth: 1)
//            .fill(Color.onBackgroundPrimary.opacity(0.0000001))
//            .rotationEffect(.degrees(-90))
//            .frame(80)
//    }
//    func createIcon() -> some View {
//        Image(icon)
//            .resizable()
//            .frame(32)
//            .foregroundColor(.onBackgroundPrimary)
//            .id(icon)
//            .transition(iconAnimation)
//    }
//}
//
//private extension CircleProgressButton {
//    var iconAnimation: AnyTransition { .scale(scale: 0.65).combined(with: .opacity) }
//}
