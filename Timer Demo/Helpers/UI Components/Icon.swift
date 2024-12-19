//
//  Icon.swift
//  Timer Demo
//
//  Created by Alina Petrovska
//    - Mail: alina.petrovska@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2024 Mijick. All rights reserved.

import SwiftUI

struct Icon: View {
    private let image: ImageResource
    private let size: CGFloat?
    private let color: Color?
    
    init(_ image: ImageResource, size: CGFloat? = nil, color: Color? = nil) {
        self.image = image
        self.size = size
        self.color = color
    }
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size, height: size)
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(color ?? .clear)
    }
}
