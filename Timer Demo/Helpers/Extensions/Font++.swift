//
//  Font++.swift
//  Timer Demo
//
//  Created by Alina Petrovska on 17.12.2024.
//

import SwiftUI

extension Font {
    init(_ weight: Font.Weight, size: CGFloat) {
        switch weight {
            case .regular: self = .custom("Inter-Regular", size: size)
            default: self = .custom("Inter-Bold", size: size)
        }
    }
}
