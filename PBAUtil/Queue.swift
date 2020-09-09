//
//  Queue.swift
//  PBAUtil
//
//  Created by parker amundsen on 9/8/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

struct Queue<Element>: ExpressibleByArrayLiteral, Sequence, IteratorProtocol {
    
    private var current = 0
    
    typealias ArrayLiteralElement = Element
    
    private var elements: Array<Element>
    
    var count: Int {
        elements.count
    }
    
    init(arrayLiteral elements: Element...) {
        self.elements = elements
    }
    
    init<list: Sequence>(_ sequence: list) where list.Element == Element {
        elements = Array(sequence)
    }
    
    init(_ array: Array<Element>) {
        self.elements = array
    }
    
    mutating func next() -> Element? {
        if current < count {
            defer {
                current += 1
            }
            return elements[current]
        }
        return nil
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    func getUnderlyingArray() -> Array<Element> {
        return elements
    }
    
}
