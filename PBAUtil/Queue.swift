//
//  Queue.swift
//  PBAUtil
//
//  Created by parker amundsen on 9/8/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

/// - FIFO data structure.
/// - Allows O(n) enqueue and dequeue operations.
class Queue<Element>: ExpressibleByArrayLiteral {
    
    var count: Int
    
    var isEmpty: Bool {
        return count == 0
    }
    
    private var linkedList: LinkedList<Element>
    
    init() {
        linkedList = []
        count = 0
    }
    /// Initializes the queue with an array literal.
    /// - Elements at the beginning of the array will start at the beginning of the queue.
    /// - Parameter elements: contents of the queue
    init(_ elements: [Element]) {
        linkedList = LinkedList<Element>(elements)
        count = elements.count
    }
    
    convenience required init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
    /// Enqueues a new element at the beginning of the queue
    /// - Parameter element: element to enqueue
    func enqueue(_ element: Element) {
        let newHead = LinkedList.Node(element)
        newHead.next = linkedList.head
        linkedList.head?.prev = newHead
        linkedList.head = newHead
        count += 1
        
        if count == 1 {
            linkedList.tail = linkedList.head
        }
    }
    
    /// Dequeues the last element in the queue.
    /// - If the queue is empty ```nil``` will be returned
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
