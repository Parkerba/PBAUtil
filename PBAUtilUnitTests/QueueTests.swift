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
        var queue: Queue<Int> = [1 ,2, 3]
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
        XCTAssertEqual(["String1", "String2", "Something"], queue.getUnderlyingArray())
        
        queue = []
        XCTAssertEqual(0, queue.count)
        queue.enqueue("")
        XCTAssertEqual(1, queue.count)
        XCTAssertEqual([""], queue.getUnderlyingArray())
    }
    
    func testDequeue() {
        var queue: Queue = ["String1", "String2"]
        XCTAssertEqual("String1", queue.dequeue())
        XCTAssertEqual(["String2"], queue.getUnderlyingArray())
        
        XCTAssertEqual("String2", queue.dequeue())
        XCTAssertEqual([], queue.getUnderlyingArray())

        XCTAssertEqual(nil, queue.dequeue())
        XCTAssertEqual([], queue.getUnderlyingArray())
    }
    
    func testSequenceConformance() {
        var queue = Queue(["1", "2", "2"])
        let set = Set<String>(queue)
        queue = Queue(set)
        XCTAssertEqual(2, queue.count)
    }

}
