//
//  LRUCache.swift
//  PBAUtil
//
//  Created by parker amundsen on 10/19/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

class LRUCache<Key: Hashable, Value> {
    
    private var linkedList = LinkedList<(key: Key, value: Value)>()
    private let limit: Int
    
    private(set) var count: Int = 0
    private var nodeMap = [Key: LinkedList<(key: Key, value: Value)>.Node]()
    
    init(_ limit: Int) {
        self.limit = limit
    }
    
    func put(_ value: Value, for key: Key) {
        let newNode = LinkedList<(key: Key, value: Value)>.Node((key: key, value: value))
        nodeMap[key] = newNode
        newNode.next = linkedList.head
        linkedList.head?.prev = newNode
        linkedList.head = newNode
        count += 1
        if count == 1 {
            linkedList.tail = newNode
        }
        if count > limit {
            removeLRU()
        }
    }
    
    func get(_ key: Key) -> Value? {
        guard let node = nodeMap[key] else { return nil }
        
        if node === linkedList.tail {
            linkedList.tail = node.prev
        }
        
        if node !== linkedList.head {
            return linkedList.head?.value.value
        }
        node.prev?.next = node.next
        node.next?.prev = node.prev
        node.next = linkedList.head
        linkedList.head?.prev = node
        node.prev = nil
        linkedList.head = node
        return node.value.value
    }
    
    private func removeLRU() {
        count -= 1
        let newTail = linkedList.tail?.prev
        linkedList.tail?.prev = nil
        newTail?.next = nil
        if let key = linkedList.tail?.value.key {
            nodeMap[key] = nil
        }
        linkedList.tail = newTail
    }
}
