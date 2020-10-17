//
//  LinkedList.swift
//  PBAUtil
//
//  Created by parker amundsen on 10/17/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

class LinkedList<Element>: ExpressibleByArrayLiteral {
    
    var head: Node? = nil
    var tail: Node? = nil
    
    class Node {
        var value: Element
        var next: Node?
        var prev: Node?
        
        init(_ value: Element, _ next: Node? = nil, _ prev: Node? = nil) {
            self.value = value
            self.next = next
            self.prev = prev
        }
    }
    
    init() {}
    
    convenience required init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
    init(_ elements: Array<Element>) {
        if elements.isEmpty { return }
        head = Node(elements[0])
        var traversalNode = head
        
        for index in 1..<elements.count {
            let next = Node(elements[index])
            traversalNode?.next = next
            next.prev = traversalNode
            traversalNode = next
        }
        tail = traversalNode
    }

}
