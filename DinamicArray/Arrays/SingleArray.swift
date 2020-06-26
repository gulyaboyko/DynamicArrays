//
//  SingleArray.swift
//  DinamicArray
//
//  Created by Gulya Boiko on 6/13/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

final class SingleArray<T>: DynamicArray {
    private (set) var array: [T?]
    private let defaultValue: T? = nil
    
    init() {
        array = Array(repeating: defaultValue, count: 0)
    }
    
    func size() -> Int {
        return array.count
    }
    
    func add(_ element: T) {
        resize()
        array[size()-1] = element
    }
    
    func add(_ element: T, index: Int) {
        if index > size() { fatalError("Index out of range") }
        if index == size() {
            add(element)
            return
        }
        resize()
        // Перемещаем значения на 1 вперед
        // i = 1
        // было [1, 2, 3, 4, defaultValue] => [1, 2, 2, 3, 4]
        let range = index+1..<size()
        for i in range.reversed() {
            array[i] = array[i-1]
        }
        // Вставляем новый элемент на его место
        // i = 1, element = 6
        // было [1, 2, 2, 3, 4] => [1, 6, 2, 3, 4]
        array[index] = element
    }
    
    func get(index: Int) -> T {
        if index > size() { fatalError("Index out of range") }
        return array[index]!
    }
    
    @discardableResult
    func remove(index: Int) -> T {
        let deletedItem = get(index: index)
        // Перемещаем значения на 1 назад
        // i = 1, было [1, 2, 3, 4, 5] => [1, 3, 4, 5, 5]
        let range = index..<size()-1
        for i in range {
            array[i] = array[i+1]
        }
        // Удаляем последний элемент
        // [1, 3, 4, 5, 5] -> [1, 3, 4, 5]
        downsizing()
        return deletedItem
    }
    
    private func resize() {
        var newArray = Array(repeating: defaultValue, count: size() + 1) // new array
        for i in 0..<array.count {
            newArray[i] = array[i]
        }
        array = newArray
    }
    
    private func downsizing() {
        var newArray = Array(repeating: defaultValue, count: size() - 1)
        for i in 0..<newArray.count {
            newArray[i] = array[i]
        }
        array = newArray
    }
}
