//
//  VectorArray.swift
//  DinamicArray
//
//  Created by Gulya Boiko on 6/13/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

final class VectorArray<T>: DynamicArray {
    private (set) var array: [T?]
    private let vector: Int
    private let defaultValue: T? = nil
    private var _size = 0
    
    init(vector: Int = 1000) {
        self.vector = vector
        array = Array(repeating: defaultValue, count: 0)
    }
    
    func size() -> Int {
        return _size
    }
    
    func add(_ element: T) {
        if size() == array.count {
            resize()
        }
        array[size()] = element
        _size += 1
    }
    
    func add(_ element: T, index: Int) {
        if index > size() { fatalError("Index out of range") }
        if index == size() {
            add(element)
            return
        }
        if size() == array.count {
            resize()
        }
        // Перемещаем значения на 1 вперед
        // i = 1, было [1, 2, 3, 4, defaultValue] => [1, 2, 2, 3, 4]
        let range = index+1...size()
        for i in range.reversed() {
            array[i] = array[i-1]
        }
        // Вставляем новый элемент на его место
        // было [1, 2, 2, 3, 4] => [1, newValue, 2, 3, 4]
        array[index] = element
        _size += 1
    }
    
    func get(index: Int) -> T {
        if index > size() { fatalError("Index out of range") }
        return array[index]!
    }
    
    @discardableResult
    func remove(index: Int) -> T {
        let deletedItem = get(index: index)
        // Перемещаем значения на 1 назад
        // i = 1, было [1, 2, 3, 4, 5, nil...] => [1, 3, 4, 5, 5, nil...]
        let range = index..<size()-1
        for i in range {
            array[i] = array[i+1]
        }
        // Заменяем последний элемент на nil
        // [1, 3, 4, 5, 5, nil...] -> [1, 3, 4, 5, nil...]
        array[size()-1] = defaultValue
        _size -= 1
        if size() <= array.count - vector {
            downsizing()
        }
        return deletedItem
    }
    
    private func resize() {
        var newArray = Array(repeating: defaultValue, count: size() + vector) // new array
        for i in 0..<array.count {
            newArray[i] = array[i]
        }
        array = newArray
    }
    
    private func downsizing() {
        var newArray = Array(repeating: defaultValue, count: array.count - vector)
        for i in 0..<newArray.count {
            newArray[i] = array[i]
        }
        array = newArray
    }
    
    subscript(index: Int) -> T {
        get {
            get(index: index)
        }
        set(newValue) {
            add(newValue, index: index)
        }
    }
    
}
