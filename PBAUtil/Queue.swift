//
//  Queue.swift
//  PBAUtil
//
//  Created by parker amundsen on 9/8/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

struct Queue<Element>: ExpressibleByArrayLiteral {
    
    typealias ArrayLiteralElement = Element
    
    private var elements: Array<Element>
    
    var count: Int {
        elements.count
    }
    
    init(arrayLiteral elements: Element...) {
        self.elements = elements
    }
    
    init(_ array: Array<Element>) {
        self.elements = array
    }
    
    mutating func enqueue(_ element: Element) {
        elements.append(element)
    }
    
    mutating func dequeue() -> Element? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
    func getUnderlyingArray() -> Array<Element> {
        return elements
    }
    
}
