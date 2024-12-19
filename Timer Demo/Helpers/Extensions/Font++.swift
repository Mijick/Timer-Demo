//
//  Font++.swift
//  Timer Demo
//
//  Created by Alina Petrovska
//    - Mail: alina.petrovska@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2024 Mijick. All rights reserved.

import SwiftUI

extension Font {
    init(_ weight: Font.Weight, size: CGFloat) {
        switch weight {
            case .regular: self = .custom("Inter-Regular", size: size)
            default: self = .custom("Inter-Bold", size: size)
        }
    }
}
