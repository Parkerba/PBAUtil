//
//  QueueTests.swift
//  PBAUtilUnitTests
//
//  Created by parker amundsen on 9/8/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import XCTest
@testable import PBAUtil

class QueueTests: XCTestCase {
    
    func testInit() {
        var queue: Queue<Int> = [1, 2, 3]
        XCTAssertEqual(3, queue.count)
        
        queue = Queue([1])
        XCTAssertEqual(1, queue.count)
        
        queue = Queue()
        XCTAssertEqual(0, queue.count)
    }
    
    func testEnqueue() {
        var queue: Queue = ["String1", "String2"]
        XCTAssertEqual(2, queue.count)
        queue.enqueue("Something")
        XCTAssertEqual(3, queue.count)
        
        queue = []
        XCTAssertEqual(0, queue.count)
        queue.enqueue("")
        XCTAssertEqual(1, queue.count)
    }
    
    func testDequeue() {
        let queue: Queue = ["String1", "String2"]
        XCTAssert(queue.count == 2)
        XCTAssert("String2" == queue.dequeue())
        XCTAssert(queue.count == 1)
        XCTAssert("String1" == queue.dequeue())
        XCTAssert(queue.count == 0)
        XCTAssertNil(queue.dequeue())
        XCTAssert(queue.count == 0)
    }
    
    func testEnqueueAndDequeue() {
        let queue: Queue<Int> = []
        let arr = [1,2,3,4,5,6]
        
        for num in arr {
            queue.enqueue(num)
        }
        var arr1: [Int] = []
        while !queue.isEmpty {
            arr1.append(queue.dequeue()!)
        }
        XCTAssertEqual(arr, arr1)
    }

}
