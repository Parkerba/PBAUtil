//
//  LinkedListTests.swift
//  PBAUtilUnitTests
//
//  Created by parker amundsen on 10/17/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import XCTest
@testable import PBAUtil

class LinkedListTests: XCTestCase {

    func testInit() {
        let arr = [1,2,3,4,5]
        let list: LinkedList<Int> = LinkedList(arr)
        
        var traversalNode = list.head
        var index = 0
        while !(traversalNode === list.tail) {
            XCTAssert(arr[index] == traversalNode?.value)
            index += 1
            traversalNode = traversalNode?.next
        }
        
        while !(traversalNode === list.head) {
            XCTAssert(arr[index] == traversalNode?.value)
            index -= 1
            traversalNode = traversalNode?.prev
        }
    }

}
