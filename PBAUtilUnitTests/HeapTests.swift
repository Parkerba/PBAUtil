//
//  HeapTests.swift
//  PBAUtilUnitTests
//
//  Created by parker amundsen on 10/18/20.
//  Copyright © 2020 Parker Amundsen. All rights reserved.
//

import XCTest
@testable import PBAUtil

class HeapTests: XCTestCase {

    func testMaxHeap() {
        let heap = Heap<String, Int>(as: .max)
        heap.insert("Top", with: 3)
        heap.insert("Bottom", with: 1)
        heap.insert("Middle", with: 2)
        
        XCTAssertEqual(heap.remove(), "Top")
        XCTAssertEqual(heap.remove(), "Middle")
        XCTAssertEqual(heap.remove(), "Bottom")
        XCTAssertNil(heap.remove())
        
        heap.insert("Bottom", with: 10)
        XCTAssertEqual(heap.peek(), "Bottom")
        XCTAssertEqual(heap.remove(), "Bottom")
        XCTAssertEqual(heap.count, 0)
        XCTAssertNil(heap.peek())
        XCTAssertNil(heap.remove())
        
        let maxNumHeap = Heap<Int,Int>(as: .max)
        for num in 0...10 {
            maxNumHeap.insert(num)
        }
        
        for num in (0...10).reversed() {
            XCTAssertEqual(num, maxNumHeap.remove())
        }
        
        XCTAssertEqual(maxNumHeap.count, 0)
        XCTAssertNil(maxNumHeap.peek())
        XCTAssertNil(maxNumHeap.remove())
    }
    
    func testMinHeap() {
        let heap = Heap<String, Int>(as: .min)
        heap.insert("Top", with: 1)
        heap.insert("Bottom", with: 3)
        heap.insert("Middle", with: 2)
        
        XCTAssertEqual(heap.remove(), "Top")
        XCTAssertEqual(heap.remove(), "Middle")
        XCTAssertEqual(heap.remove(), "Bottom")
        XCTAssertNil(heap.remove())
        
        heap.insert("Bottom", with: 10)
        XCTAssertEqual(heap.peek(), "Bottom")
        XCTAssertEqual(heap.remove(), "Bottom")
        XCTAssertEqual(heap.count, 0)
        XCTAssertNil(heap.peek())
        XCTAssertNil(heap.remove())
        
        let minNumHeap = Heap<Int,Int>(as: .min)
        for num in 0...10 {
            minNumHeap.insert(num)
        }
        
        for num in 0...10 {
            XCTAssertEqual(num, minNumHeap.remove())
        }
        
        XCTAssertEqual(minNumHeap.count, 0)
        XCTAssertNil(minNumHeap.peek())
        XCTAssertNil(minNumHeap.remove())
    }

}
