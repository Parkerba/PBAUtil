//
//  Stack.swift
//  PBAUtil
//
//  Created by parker amundsen on 9/8/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

struct Stack<Element>: ExpressibleByArrayLiteral, Sequence, IteratorProtocol {
    
    private var current = 0
    
    typealias ArrayLiteralElement = Element
        
    private var elements: Array<Element>
    
    var count: Int {
        elements.count
    }
    
    init(arrayLiteral elements: Element...) {
        self.elements = elements
    }
    
    init(_ array: [Element] = []) {
        self.elements = array
    }
    
    init<list: Sequence>(_ sequence: list) where list.Element == Element {
        elements = Array(sequence)
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
    
    @discardableResult
    mutating func pop() -> Element? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    mutating func push(_ element: Element) {
        elements.append(element)
    }
    
    func getUnderlyingArray() -> Array<Element> {
        return elements
    }
    
}
