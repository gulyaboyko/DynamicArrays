//
//  MatrixArray.swift
//  DinamicArray
//
//  Created by Gulya Boiko on 6/16/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

final class MatrixArray<T>: DynamicArray {
    private (set) var array: FactorArray<VectorArray<T?>>
    private let vector: Int
    private let defaultValue: T? = nil
    private var _size = 0
    
    init(vector: Int = 1000) {
        self.vector = vector
        self.array = FactorArray<VectorArray<T?>>()
    }
    
    func size() -> Int {
        return _size
    }
    
    func add(_ element: T) {
        if size() == array.size() * vector {
            array.add(VectorArray(vector: vector))
        }
        array.get(index: _size / vector)[_size % vector] = element
        _size += 1
    }
    
    func add(_ element: T, index: Int) {
        if index > size() { fatalError("Index out of range") }
        if index == size() {
            add(element)
            return
        }
        if size() == array.size() * vector {
            array.add(VectorArray(vector: vector))
        }
        let arrayRange = (index / vector)..<array.size()-1
        var insertableElement = element
        var insertableIndex = index % vector
        // add in previus arrays - before last one
        for i in arrayRange {
            let lastElement = array.get(index: i).remove(index: vector-1)
            array.get(index: i).add(insertableElement, index: insertableIndex)
            insertableElement = lastElement!
            insertableIndex = 0
        }
        // add in last vector array
        array.get(index: array.size()-1).add(insertableElement, index: insertableIndex)
        _size += 1
    }
    
    func get(index: Int) -> T {
        if index > size() { fatalError("Index out of range") }
        return array.get(index: index / vector)[index % vector]!
    }
    
    @discardableResult
    func remove(index: Int) -> T {
        let deletedItem = get(index: index)
        let arrayRange = (index / vector)+1..<array.size()
        var insertableElement: T?
        // delete from last to curent
        for i in arrayRange.reversed() {
            let newElement = array.get(index: i).remove(index: 0)
            if let insertableElement = insertableElement {
                array.get(index: i).add(insertableElement)
            }
            insertableElement = newElement
        }
        // delete from current
        array.get(index: (index / vector)).remove(index: index % vector)
        if let insertableElement = insertableElement {
            array.get(index: (index / vector)).add(insertableElement)
        }
        if array.get(index: array.size()-1).size() == 0 {
            array.remove(index: array.size()-1)
        }
        _size -= 1
        return deletedItem
    }
    
}
