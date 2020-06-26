//
//  Node.swift
//  DinamicArray
//
//  Created by Gulya Boiko on 6/24/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

final class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> " + String(describing: next) + " "
    }
}
