//
//  Heap.swift
//  PBAUtil
//
//  Created by parker amundsen on 10/18/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import Foundation


/// Heap is a binary heap structure that can be used as a priority queue.
/// - This provides for 0(1) access to the top of the heap and o(logn) insertion and removal times
/// - Priority needs to be comparable. This is what is used to maintain the heap like properties.
/// - Element can be of any type. However if Element is of type Priority then insertion can be made with only the element.
class Heap<Element, Priority: Comparable> {
    
    
    /// Type used to determine the functionality of the heap.
    /// - min places the smallest (lowest) priority node at the root of the heap
    /// - max places the largest (highest) priority node at the root of the heap
    enum HeapType {
        case min
        case max
    }
    
    
    /// This is the node class that Heap will use to form the tree structure
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
    
    /// number of elements in the heap
    var count: Int = 0
    
    private var root: Node<Element, Priority>?
    
    private(set) var heapType: HeapType
    
    init(as type: HeapType) {
        self.heapType = type
    }
    
    func peek() -> Element? {
        return root?.value
    }
    
    /// Inserts a new node in the heap.
    /// - Parameters:
    ///   - element: The value that will be tied to the priority and eventually returned when removed.
    ///   - priority: The priority that will be used to order the nodes.
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
    
    /// This function removes the highest (max heap type) or the lowest (min heap type) priority element in the heap.
    /// - Returns: The element of the node being removed from the heap.
    @discardableResult
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
    
    
    /// Used after insertion as nodes are inserted in the "last" position even if they do not belong there.
    /// - Parameter node: Node that was recently inserted and needs to have position validated.
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
    
    /// Used after removal, the root node is replaced with the node in the "last" position.
    /// The new node in the root position will be bubbled down until in the correct position.
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
    
    /// This function finds the parent of the "next position", used to insert a new node.
    /// - Returns: The parent of the "next" position.
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
    
    
    /// Used for removals. This finds the last node to replace  the root node.
    /// - Returns: The node occupying the "last" position.
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
    
    /// This is a overloaded insert method that allows easy insertion with the element that its self will be used for comparison.
    /// - Parameter element: the element that will also act as priority.
    func insert(_ element: Element) {
        insert(element, with: element)
    }
}
