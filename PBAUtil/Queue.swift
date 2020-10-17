//
//  Queue.swift
//  PBAUtil
//
//  Created by parker amundsen on 9/8/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

class Queue<Element>: ExpressibleByArrayLiteral {
    var count: Int
    private var linkedList: LinkedList<Element>
    
    init() {
        linkedList = []
        count = 0
    }
    
    init(_ elements: [Element]) {
        linkedList = LinkedList<Element>(elements)
        count = elements.count
    }
    
    convenience required init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
    func enqueue(_ element: Element) {
        let newHead = LinkedList.Node(element)
        newHead.next = linkedList.head
        linkedList.head?.prev = newHead
        linkedList.head = newHead
        count += 1
    }
    
    @discardableResult
    func dequeue() -> Element? {
        if linkedList.tail == nil { return nil }
        let toDequeue = linkedList.tail
        linkedList.tail = linkedList.tail?.prev
        linkedList.tail?.next = nil
        count -= 1
        return toDequeue?.value
    }
    
}
