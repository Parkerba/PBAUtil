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
        
        stack = Stack<Int>([1,2,3])
        XCTAssertEqual(3, stack.count)
        
        stack = [1,2]
        XCTAssertEqual(2, stack.count)
    }
    
    func testPop() {
        var stack = Stack<Int>([1,2,3])
        XCTAssertEqual(1, stack.pop())
        XCTAssertEqual(2, stack.count)
        
        XCTAssertEqual(2, stack.pop())
        XCTAssertEqual(1, stack.count)
        
        XCTAssertEqual(3, stack.pop())
        XCTAssertEqual(0, stack.count)
        
        XCTAssertNil(stack.pop())
        XCTAssertEqual(0, stack.count)
    }
    
    func testPush() {
        var stack = Stack<Int>([1,2])
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
    
    func testGetUnderlyingArray() {
        let stackArr = [1,2,3]
        var stack: Stack = [1,2,3]
        XCTAssertEqual(stackArr, stack.getUnderlyingArray())
        stack.pop()
        XCTAssertNotEqual(stackArr, stack.getUnderlyingArray())
    }

}
