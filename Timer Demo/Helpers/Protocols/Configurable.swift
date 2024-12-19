//
//  Configurable.swift
//  Timer Demo
//
//  Created by Alina Petrovska
//    - Mail: alina.petrovska@mijick.com
//    - GitHub: https://github.com/Mijick
//
//  Copyright ©2024 Mijick. All rights reserved.

import Foundation

protocol Configurable { }

extension Configurable {
    func configure<T>(path: WritableKeyPath<Self, T>, _ value: T) -> Self {
        var copy = self
        copy[keyPath: path] = value
        return copy
    }
}
