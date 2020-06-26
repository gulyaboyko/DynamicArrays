//
//  Array.swift
//  DinamicArray
//
//  Created by Gulya Boiko on 6/24/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

final class ListArray<T>: DynamicArray {
    private (set) var array: [T] = []
    
    func size() -> Int {
        return array.count
    }
    
    func add(_ element: T) {
        array.append(element)
    }
    
    func add(_ element: T, index: Int) {
        array.insert(element, at: index)
    }
    
    func get(index: Int) -> T {
        return array[index]
    }
    
    func remove(index: Int) -> T {
        return array.remove(at: index)
    }
}
