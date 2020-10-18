//
//  StackTests.swift
//  PBAUtil
//
//  Created by parker amundsen on 9/8/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import XCTest
@testable import PBAUtil

class StackTests: XCTestCase {
    
    func testStackInit() {
        var stack = Stack<Int>()
        XCTAssertEqual(0, stack.count)
        
        stack = Stack<Int>([1, 2, 3])
        XCTAssertEqual(3, stack.count)
        
        stack = [1,2]
        XCTAssertEqual(2, stack.count)
    }
    
    func testPop() {
        let stack = Stack<Int>([1, 2, 3])
        XCTAssertEqual(3, stack.pop())
        XCTAssertEqual(2, stack.count)
        
        XCTAssertEqual(2, stack.pop())
        XCTAssertEqual(1, stack.count)
        
        XCTAssertEqual(1, stack.pop())
        XCTAssertEqual(0, stack.count)
        
        XCTAssertNil(stack.pop())
        XCTAssertEqual(0, stack.count)
    }
    
    func testPush() {
        var stack = Stack<Int>([1, 2])
        XCTAssertEqual(2, stack.count)
        stack.push(3)
        XCTAssertEqual(3, stack.count)
        
        stack.push(4)
        XCTAssertEqual(4, stack.count)
        
        stack = []
        XCTAssertEqual(0, stack.count)
        stack.push(0)
        XCTAssertEqual(1, stack.count)
    }
    
    func testPushAndPop() {
        let stack = Stack<Int>()
        XCTAssertEqual(stack.count, 0)
        XCTAssertEqual(stack.pop(), nil)
        
        stack.push(4)
        XCTAssertEqual(stack.pop(), 4)
        XCTAssertEqual(stack.count, 0)

        stack.push(1)
        stack.push(2)
        stack.push(3)
        XCTAssertEqual(stack.count, 3)
        XCTAssertEqual(stack.pop(), 3)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.count, 1)
        stack.push(2)
        XCTAssertEqual(stack.count, 2)
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.pop(), 1)
        XCTAssertEqual(stack.pop(), nil)
    }

}
