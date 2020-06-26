//
//  Queue.swift
//  DinamicArray
//
//  Created by Gulya Boiko on 6/24/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

final class Queue<T> {
    private var head: Node<T>?
    private var tail: Node<T>?
    
    var isEmpty: Bool { head == nil }
    
    // O(1)
    func push(value: T) {
        let newNode = Node(value: value, next: nil)
        tail?.next = newNode
        tail = newNode
        if head == nil {
            head = tail
        }
    }
    
    // O(1)
    @discardableResult
    func pop() -> T? {
        defer { // выполняет после return (выхода из функции)
            head = head?.next
            if isEmpty { tail = nil }
        }
        return head?.value
    }
    
    // O(n)
    func node(at index: Int) -> Node<T>? {
        var resultNode = head
        var currentIndex = 0
        let isNotEnd = { resultNode != nil }
        let isNotReachedIndex = { index != currentIndex }

        while isNotEnd() && isNotReachedIndex() {
            resultNode = resultNode?.next
            currentIndex += 1
        }
        return resultNode
    }

}

extension Queue: CustomStringConvertible {
    public var description: String {
        guard let head = head else { return "Список пуст" }
        return String(describing: head)
    }
}
