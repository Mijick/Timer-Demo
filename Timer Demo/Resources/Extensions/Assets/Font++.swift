//
//  Font++.swift of Timer Demo
//
//  Created by Tomasz Kurylik
//    - Twitter: https://twitter.com/tkurylik
//    - Mail: tomasz.kurylik@mijick.com
//    - GitHub: https://github.com/FulcrumOne
//
//  Copyright ©2023 Mijick. Licensed under MIT License.


import SwiftUI

extension Font {
    static func semiBold(_ size: CGFloat) -> Font { .custom("Inter-SemiBold", size: size) }
    static func regular(_ size: CGFloat) -> Font { .custom("Inter-Regular", size: size) }
    static func mono(_ size: CGFloat) -> Font { .custom("DMMono-Regular", size: size) }
}
