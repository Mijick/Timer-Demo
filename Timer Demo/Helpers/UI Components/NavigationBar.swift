//
//  NavigationBar.swift of Timer Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI
import MijickTimer

//struct NavigationBar: View {
//    let title: String
//    let time: MTime
//
//
//    var body: some View {
//        HStack(spacing: 0) {
//            Spacer()
//            createNavigationBarHeader().alignmentGuide(.customCenter) { $0[HorizontalAlignment.center] }
//            Spacer()
//            createNavigationBarCloseButton()
//        }
//        .frame(alignment: .init(horizontal: .customCenter, vertical: .center))
//    }
//}
//private extension NavigationBar {
//    func createNavigationBarHeader() -> some View {
//        VStack(alignment: .center, spacing: 4) {
//            createNavigationBarHeaderNameText()
//            createNavigationBarHeaderTimeText()
//        }
//    }
//    func createNavigationBarCloseButton() -> some View {
//        Button(action: onCloseButtonTap) {
//            Image("icon.close")
//                .resizable()
//                .frame(24)
//                .foregroundColor(.onBackgroundPrimary)
//        }
//    }
//}
//private extension NavigationBar {
//    func createNavigationBarHeaderNameText() -> some View {
//        Text(title)
//            .font(.semiBold(16))
//            .foregroundColor(.onBackgroundPrimary)
//    }
//    func createNavigationBarHeaderTimeText() -> some View {
//        Text(timeText)
//            .font(.regular(13))
//            .foregroundColor(.onBackgroundSecondary)
//    }
//}
//
//private extension NavigationBar {
//    func onCloseButtonTap() {
//
//    }
//}
//
//private extension NavigationBar {
//    var timeText: String { time.toString {
//        $0.unitsStyle = .full
//        $0.allowedUnits = [.hour, .minute]
//        return $0
//    }}
//}
//
//
//// MARK: - Custom Center Alignment
//fileprivate extension HorizontalAlignment {
//    enum CustomCenter: AlignmentID {
//        static func defaultValue(in d: ViewDimensions) -> CGFloat { d[HorizontalAlignment.center] }
//    }
//
//    static let customCenter = HorizontalAlignment(CustomCenter.self)
//}
