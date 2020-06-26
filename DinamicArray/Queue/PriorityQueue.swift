//
//  PriorityQueue.swift
//  DinamicArray
//
//  Created by Gulya Boiko on 6/24/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

final class PriorityQueue<T> {
    private (set) var sortedQueue: [Int: Queue<T>] = [:]
    
    init(priority: [Int]) {
        priority.forEach { self.sortedQueue[$0] = Queue<T>() }
    }
 
    func enqueue(value: T, priority: Int) {
        guard sortedQueue.keys.contains(priority) else { return }
        sortedQueue[priority]?.push(value: value)
    }
    
    @discardableResult
    func dequeue() -> T? {
        var priority = sortedQueue.keys.sorted()
        while priority.count > 0 {
            let minPriority = priority.removeFirst()
            if let value = sortedQueue[minPriority]?.pop() {
                return value
            }
        }
        return nil
    }
    
}
