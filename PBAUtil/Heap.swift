//
//  Heap.swift
//  PBAUtil
//
//  Created by parker amundsen on 10/18/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation

class Heap<Element, Priority: Comparable> {
    
    enum HeapType {
        case min
        case max
    }
    
    class Node<Element, Priority: Comparable> {
        
        var parent: Node?
        var left: Node?
        var right: Node?
        var value: Element
        var priority: Priority
        
        init(_ value: Element, with priority: Priority) {
            self.value = value
            self.priority = priority
        }
        
        func swapWithParent() {
            guard let parent = parent else { return }
            
            let parentValue = parent.value
            let parentPriority = parent.priority
            
            parent.value = value
            parent.priority = priority
            
            priority = parentPriority
            value = parentValue
        }
        
        func minOfChildren() -> Node<Element, Priority>? {
            if let left = left, let right = right {
                return (left.priority < right.priority) ? left : right
            } else if let left = left {
                return left
            } else {
                return right
            }
        }
        
        func maxOfChildren() -> Node<Element, Priority>? {
            if let left = left, let right = right {
                return (left.priority > right.priority) ? left : right
            } else if let left = left {
                return left
            } else {
                return right
            }
        }
        
    }
    
    var count: Int = 0
    
    private var root: Node<Element, Priority>?
    
    private(set) var heapType: HeapType
    
    init(as type: HeapType) {
        self.heapType = type
    }
    
    func peek() -> Element? {
        return root?.value
    }
    
    func insert(_ element: Element, with priority: Priority) {
        let newNode = Node<Element, Priority>(element, with: priority)
        count += 1
        guard count != 1,
              let parent = findParentOfNextPosition() else {
            root = Node<Element, Priority>(element, with: priority)
            return
        }
        
        if parent.left == nil {
            parent.left = newNode
            newNode.parent = parent
        } else {
            parent.right = newNode
            newNode.parent = parent
        }
        bubbleUp(newNode)
    }
    
    func remove() -> Element? {
        guard let rootElement = root?.value else { return nil }
        
        guard count != 1,
              let last = findLastPosition() else {
            root = nil
            count = 0
            return rootElement
        }
        if last.parent?.left === last {
            last.parent?.left = nil
            last.parent = nil
        } else {
            last.parent?.right = nil
            last.parent = nil
        }
        root?.value = last.value
        root?.priority = last.priority
        bubbleDown()
        count -= 1
        return rootElement
    }
    
    private func bubbleUp(_ node: Node<Element, Priority>) {
        var node = node
        if heapType == .max {
            while node.parent != nil && node.parent!.priority < node.priority {
                node.swapWithParent()
                node = node.parent!
            }
        } else {
            while node.parent != nil && node.parent!.priority > node.priority {
                node.swapWithParent()
                node = node.parent!
            }
        }
        
        if node.parent == nil {
            root = node
        }
    }
    
    private func bubbleDown() {
        guard var node = root else { return }
        if heapType == .max {
            while true {
                let maxChild = node.maxOfChildren()
                if maxChild != nil && maxChild!.priority > node.priority {
                    maxChild?.swapWithParent()
                    node = maxChild!
                } else {
                    return
                }
            }
        } else {
            while true {
                let minChild = node.minOfChildren()
                if minChild != nil && minChild!.priority < node.priority {
                    minChild?.swapWithParent()
                    node = minChild!
                } else {
                    return
                }
            }
        }
    }
    
    private func findParentOfNextPosition() -> Node<Element, Priority>? {
        var iTrimmed = count << count.leadingZeroBitCount
        iTrimmed <<= 1
        var node: Node<Element, Priority>?
        node = root
        for _ in 0..<(count.bitWidth - count.leadingZeroBitCount - 1) {
            let leading = iTrimmed.leadingZeroBitCount
            iTrimmed <<= 1
            if leading == 0 {
                if node?.right == nil {
                    return node
                }
                node = node?.right
            } else {
                if node?.left == nil {
                    return node
                }
                node = node?.left
            }
        }
        return node
    }
    
    private func findLastPosition() -> Node<Element, Priority>? {
        var node = root
        
        var iTrimmed = count << count.leadingZeroBitCount
        iTrimmed <<= 1
        for _ in 0..<(count.bitWidth - count.leadingZeroBitCount - 1) {
            let leading = iTrimmed.leadingZeroBitCount
            iTrimmed <<= 1
            if leading == 0 {
                node = node?.right
            } else {
                node = node?.left
            }
        }
        return node
    }
    
}

extension Heap where Element == Priority {
    func insert(_ element: Element) {
        insert(element, with: element)
    }
}
