//
//  Stack.swift
//  PBAUtil
//
//  Created by parker amundsen on 9/8/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

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
    
    init(_ elements: [Element]) {
        linkedList = LinkedList(elements)
        count = elements.count
    }
    
    convenience required init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
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
