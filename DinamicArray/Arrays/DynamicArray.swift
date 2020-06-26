//
//  DynamicArray.swift
//  DinamicArray
//
//  Created by Gulya Boiko on 6/13/20.
//  Copyright © 2020 com.gulya.boiko. All rights reserved.
//

import Foundation

protocol DynamicArray {
    associatedtype T
    func size() -> Int
    func add(_ element: T)
    func add(_ element: T, index: Int)
    func get(index: Int) -> T
    func remove(index: Int) -> T
}
