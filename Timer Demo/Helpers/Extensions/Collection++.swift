//
//  Collection++.swift
//  Timer Demo
//
//  Created by Alina Petrovska on 18.12.2024.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? { indices.contains(index) ? self[index] : nil }
}
