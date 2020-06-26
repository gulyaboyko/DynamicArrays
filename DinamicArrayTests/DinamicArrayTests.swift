//
//  DinamicArrayTests.swift
//  DinamicArrayTests
//
//  Created by Gulya Boiko on 6/9/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import XCTest
@testable import DinamicArray

final class DinamicArrayTests: XCTestCase {

    func test_queue() {
        var sut = Queue<Int>()
        sut.push(value: 1)
        sut.push(value: 2)
        print(sut.pop())
        print(sut.pop())
        print(sut.pop())
    }
    
    func test_priorityQueue() {
        let sut = PriorityQueue<Int>(priority: [0, 1, 2])
        sut.enqueue(value: 100, priority: 1)
        sut.enqueue(value: 200, priority: 0)
        sut.enqueue(value: 300, priority: 0)
        sut.enqueue(value: 400, priority: 2)
        sut.enqueue(value: 500, priority: 2)
        print(sut.dequeue()) // 200
        print(sut.dequeue()) // 300
        print(sut.dequeue()) // 100
        print(sut.dequeue()) // 400
        print(sut.dequeue()) // 500
    }
    
    func test_singleArray() {
        let sut = SingleArray<Int>()
        sut.add(1)
        sut.add(2)
        sut.add(4)
        sut.add(5)
        sut.add(6)
        sut.add(0, index: 0)
        sut.add(3, index: 3)
        print(sut.array)
        sut.remove(index: 0)
        sut.remove(index: 3)
        print(sut.array)
    }
    
    func test_vectorArray() {
        let sut = VectorArray<Int>(vector: 2)
        sut.add(1)
        sut.add(2)
        sut.add(4)
        sut.add(5)
        sut.add(6)
        sut.add(0, index: 0)
        sut.add(3, index: 3)
        print(sut.array)
        print(sut.size())
        sut.remove(index: 0)
        print(sut.array)
        print(sut.size())
        sut.remove(index: 3)
        print(sut.array)
        print(sut.size())
        sut.remove(index: 4)
        print(sut.array)
        print(sut.size())
    }
    
    func test_factorArray() {
        let sut = FactorArray<Int>()
        sut.add(1)
        sut.add(2)
        sut.add(4)
        sut.add(5)
        sut.add(6)
        sut.add(0, index: 0)
        print(sut.array)
        print(sut.size())
        sut.add(3, index: 3)
        print(sut.array)
        print(sut.size())
        sut.remove(index: 0)
        print(sut.array)
        print(sut.size())
        sut.remove(index: 3)
        print(sut.array)
        print(sut.size())
        sut.remove(index: 4)
        print(sut.array)
        print(sut.size())
    }
    
    func test_matrixArray() {
        let sut = MatrixArray<Int>(vector: 3)
        sut.add(0)
        sut.add(1)
        sut.add(2)
        sut.add(3)
        sut.add(4)
        sut.add(5)
        sut.add(6)
        sut.remove(index: 6)
        print(sut.array[0].array)
        print(sut.array[1].array)
    }
    
    func test() {
        let singleArray = SingleArray<Int>()
//        let vectorArray = VectorArray<Int>(vector: 10000)
//        let factorArray = FactorArray<Int>()
//        let matrixArray = MatrixArray<Int>(vector: 10000)
//        let array = ListArray<Int>()
        add(array: singleArray, n: 100_000)
        addAtFirstIndex(array: singleArray)
        addInTheMiddle(array: singleArray)
        addAtTheEnd(array: singleArray)
        getAtFirstIndex(array: singleArray)
        getInTheMiddle(array: singleArray)
        getAtTheEnd(array: singleArray)
        removeAtFirstIndex(array: singleArray)
        removeInTheMiddle(array: singleArray)
        removeAtTheEnd(array: singleArray)
    }
    
    private func add<T: DynamicArray>(array: T, n: Int) {
        let startDate = Date()
        for i in 0...n {
            array.add(i as! T.T)
        }
        print("Creation \(array.self) \(startDate.distance(to: Date()) * 1000)")
    }
    
    private func addAtFirstIndex<T: DynamicArray>(array: T) {
        let startDate = Date()
        array.add(1 as! T.T, index: 0)
        print("addAtFirstIndex \(array.self) \(startDate.distance(to: Date()) * 1000)")
    }
    
    private func addInTheMiddle<T: DynamicArray>(array: T) {
        let startDate = Date()
        array.add(1 as! T.T, index: array.size() >> 1)
        print("addInTheMiddle \(array.self) \(startDate.distance(to: Date()) * 1000)")
    }
    
    private func addAtTheEnd<T: DynamicArray>(array: T) {
        let startDate = Date()
        array.add(1 as! T.T)
        print("addAtTheEnd \(array.self) \(startDate.distance(to: Date()) * 1000)")
    }
    
    private func getAtFirstIndex<T: DynamicArray>(array: T) {
        let startDate = Date()
        array.get(index: 0)
        print("getAtFirstIndex \(array.self) \(startDate.distance(to: Date()) * 1000)")
    }
    
    private func getInTheMiddle<T: DynamicArray>(array: T) {
        let startDate = Date()
        array.get(index: array.size() >> 1)
        print("getInTheMiddle \(array.self) \(startDate.distance(to: Date()) * 1000)")
    }
    
    private func getAtTheEnd<T: DynamicArray>(array: T) {
        let startDate = Date()
        array.get(index: array.size() - 1)
        print("getAtTheEnd \(array.self) \(startDate.distance(to: Date()) * 1000)")
    }
    
    private func removeAtFirstIndex<T: DynamicArray>(array: T) {
        let startDate = Date()
        array.remove(index: 0)
        print("removeAtFirstIndex \(array.self) \(startDate.distance(to: Date()) * 1000)")
    }
    
    private func removeInTheMiddle<T: DynamicArray>(array: T) {
        let startDate = Date()
        array.remove(index: array.size() >> 1)
        print("removeInTheMiddle \(array.self) \(startDate.distance(to: Date()) * 1000)")
    }
    
    private func removeAtTheEnd<T: DynamicArray>(array: T) {
        let startDate = Date()
        array.remove(index: array.size() - 1)
        print("removeAtTheEnd \(array.self) \(startDate.distance(to: Date()) * 1000)")
    }

}
