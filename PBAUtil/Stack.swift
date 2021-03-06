//
//  Stack.swift
//  PBAUtil
//
//  Created by parker amundsen on 9/8/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

/// Stack is a LIFO data structure that uses a LinkedList to accomplish o(n) ```push(element)``` and  ```pop()``` operations
class Stack<Element>: ExpressibleByArrayLiteral {
    
    var count: Int
    private var linkedList: LinkedList<Element>
    
    var isEmpty: Bool {
        return count == 0
    }
    
    init() {
        linkedList = []
        count = 0
    }
    /// Elements from the array will be placed in the order of the stack from beginning to end.
    init(_ elements: [Element]) {
        linkedList = LinkedList(elements)
        count = elements.count
    }
    
    convenience required init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
    /// Places element on "top" of the stack.
    func push(_ element: Element) {
        let newNode = LinkedList.Node(element)
        if count == 0 {
            linkedList.head = newNode
            linkedList.tail = linkedList.head
        } else {
            linkedList.tail?.next = newNode
            newNode.prev = linkedList.tail
            linkedList.tail = linkedList.tail?.next
        }
        count += 1
    }
    
    /// Removes element from "top" of the stack.
    @discardableResult
    func pop() -> Element? {
        if isEmpty { return nil }
        let poppedValue = linkedList.tail?.value
        linkedList.tail = linkedList.tail?.prev
        linkedList.tail?.next = nil
        count -= 1
        return poppedValue
    }
    
}
